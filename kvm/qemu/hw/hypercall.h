/*
 * QEMU-KVM Hypercall emulation
 * 
 * Copyright (c) 2003-2004 Fabrice Bellard
 * Copyright (c) 2006 Qumranet
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#define HCR_REGISTER    0x00  // Hypercall Command Register WR
#define HSR_REGISTER    0x04  // Hypercall Status Register RD
#define HP_TXSIZE       0x08
#define HP_TXBUFF       0x0c
#define HP_RXSIZE       0x10
#define HP_RXBUFF       0x14

// HCR_REGISTER commands
#define HCR_DI		1 // disable interrupts
#define HCR_EI		2 // enable interrupts
#define HCR_GRS		4 // Global reset
#define HCR_RESET	(HCR_GRS|HCR_DI)


// Bits in HSR_REGISTER
#define HSR_VDR		0x01  // vmchannel Data is ready to be read

#define HP_MEM_SIZE    0xE0


