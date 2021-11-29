/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "sleep.h"
#include "platform.h"
#include "xil_printf.h"
#include "xscugic.h"
#include <stdatomic.h>
#include "xgpio.h"
#include <stdbool.h>
#include "xaxidma.h"

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID
XGpio Gpio;
XAxiDma AxiDma;
XScuGic InterruptController;
static XScuGic_Config *GicConfig;
int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr);
void DeviceDriverHandler(void *CallbackRef);
void DeviceDriverHandler2(void *CallbackRef);

int XAxiDma_SimplePollExample(u16 DeviceId);
static int CheckData(void);
atomic_bool adderdone;
atomic_int interruptCount;

int main()
{
    int Status;

	xil_printf("\r\n--- Entering main() --- \r\n");

	/* Run the poll example for simple transfer */
	Status = XAxiDma_SimplePollExample(DMA_DEV_ID);

	if (Status != XST_SUCCESS) {
		xil_printf("XAxiDma_SimplePoll Example Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran XAxiDma_SimplePoll Example\r\n");

	xil_printf("--- Exiting main() --- \r\n");

	return XST_SUCCESS;



    interruptCount = 0;
	adderdone = false;
    init_platform();

    Status = XGpio_Initialize(&Gpio, XPAR_GPIO_0_DEVICE_ID);
    if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

    GicConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	if (NULL == GicConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&InterruptController, GicConfig,
					GicConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
    XScuGic_SetPriorityTriggerType(&InterruptController, XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR,0xA0, 0x3);
    XScuGic_SetPriorityTriggerType(&InterruptController, 62, 0x80, 0x3);




	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly
	 */
	// Status = XScuGic_SelfTest(&InterruptController);
	// if (Status != XST_SUCCESS) {
		// return XST_FAILURE;
	// }


	/*
	 * Setup the Interrupt System
	 */
	Status = SetUpInterruptSystem(&InterruptController);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler performs
	 * the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(&InterruptController, XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR,
			   (Xil_ExceptionHandler)DeviceDriverHandler,
			   (void *)&Gpio);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	Status = XScuGic_Connect(&InterruptController, 62,
			   (Xil_ExceptionHandler)DeviceDriverHandler2,
			   NULL);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device and then cause (simulate) an
	 * interrupt so the handlers will be called
	 */
	XScuGic_Enable(&InterruptController, XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR);
	XScuGic_Enable(&InterruptController, 62);
    XGpio_InterruptEnable(&Gpio, 1);
    XGpio_InterruptGlobalEnable(&Gpio);
	/*
	 *  Simulate the Interrupt
	 */
	// Status = XScuGic_SoftwareIntr(&InterruptController,
					// INTC_DEVICE_INT_ID,
					// XSCUGIC_SPI_CPU0_MASK);
	// if (Status != XST_SUCCESS) {
		// return XST_FAILURE;
	// }

	/*
	 * Wait for the interrupt to be processed, if the interrupt does not
	 * occur this loop will wait forever
	 */
	while (1) {
		/*
		 * If the interrupt occurred which is indicated by the global
		 * variable which is set in the device driver handler, then
		 * stop waiting
		 */
        Xil_Out32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x00, 100 );
        Xil_Out32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x04, 500 );
        u32 tempVal = Xil_In32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x00);
        xil_printf("number 1 is %d\r\n", tempVal);
        tempVal = Xil_In32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x04);
        xil_printf("number 2 is %d\r\n", tempVal);

		adderdone = false;
        Xil_Out32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x08, 0x00000001 );
		while(adderdone == false) {
			usleep(10);
		}
        tempVal = Xil_In32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x0C);
        xil_printf("number 2 is %d\r\n", tempVal);
        xil_printf("INTCOUNT: %d\r\n", (int)interruptCount);
        sleep(1);
	}

	return XST_SUCCESS;

    print("Hello World\n\r");
    print("Successfully ran Hello World application");
    cleanup_platform();
    return 0;
}
int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr)
{

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the ARM processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			XScuGicInstancePtr);

	/*
	 * Enable interrupts in the ARM
	 */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}
void DeviceDriverHandler(void *CallbackRef) {
    XGpio *GpioPtr = (XGpio *)CallbackRef;
    // u32 Reg = XGpio_ReadReg(GpioPtr->BaseAddress, XGPIO_ISR_OFFSET);
    interruptCount++;
    XGpio_InterruptClear(GpioPtr, 1);
}
void DeviceDriverHandler2(void *CallbackRef) {
    Xil_Out32(XPAR_TESTADDER_0_S00_AXI_BASEADDR + 0x08, 0x00000002 );
	adderdone = true;
}
