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
#include "platform.h"
#include "xil_printf.h"


volatile unsigned int *HALF = (unsigned int *) 0x44A00000;
volatile unsigned int *DAC_PSI = (unsigned int *) 0x44A10000;
volatile unsigned int *DAC_16bit = (unsigned int*) 0x44A20000;

int main()
{
    init_platform();

    printf("Hello World\n\r");

    //input is frequency
    //10k-10M
    //base clk is 100Mhz, want to be more accurate switch to 400Mhz.
    float frequency = 3000000;
    *HALF = 50000000/frequency;


    //*LED = 4;
    printf("the HALF is %ld\n", *HALF);


    //test the DAC using the PSI, input data:

    //*DAC_PSI = 0x0af; //0 10
    int a = 0xF50; // 111101010000
    int b = 0xAAA; //101010101010
    int c = 0xF0AA;//1111000010101010

    *DAC_PSI = a; //pin JC1
    *DAC_16bit = c; //pin JD2

    //pin JD2 is data output
    //switch1 reset the PSI
    //switch2 load
    //output SYNC is pin JD3
    //output CLK is pin JD4

   /*16 bits DAC driver
    * JC1 is the serialized data
    * JC2 is the clock?
    * Button M19 is load
    * Button C19 is reset signal
    */



    cleanup_platform();
    return 0;
}

