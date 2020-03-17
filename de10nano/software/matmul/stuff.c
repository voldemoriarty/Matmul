#include "stuff.h"
#include "system.h"
#include <stdio.h>
#include <stdint.h>

#define DIM   5
#define SIZE  (DIM*DIM)

volatile uint16_t A [SIZE] = {
    0,  1,  2,  3,  4,
    5,  6,  7,  8,  9,
    10, 11, 12, 13, 14,
    15, 16, 17, 18, 19,
    20, 21, 22, 23, 24
};

volatile uint16_t B [SIZE] = {
    0,  1,  2,  3,  4,
    5,  6,  7,  8,  9,
    10, 11, 12, 13, 14,
    15, 16, 17, 18, 19,
    20, 21, 22, 23, 24
};

volatile uint32_t C [SIZE];

typedef uint32_t u32;

typedef struct msgmda {
	volatile u32 *base;
	volatile u32 *desc;
} msgdma;

/*
 * Stream data to the input port of the multiplier
 */
static void qStreamTo (msgdma *dma, volatile uint16_t *src, u32 len) {
	dma->desc[0] = (u32) src;
	dma->desc[2] = len;
	dma->desc[3] = (1 << 31);
}

/*
 * Stream data from the output port of the multiplier
 */
static void qStreamFrom (msgdma *dma, volatile u32 *dst, u32 len) {
  dma->desc[1] = (u32) dst;
  dma->desc[2] = len;
  dma->desc[3] = (1 << 31);
}

void doStuff() {
  msgdma dmaA, dmaB, dmaR;

  dmaA.base = (volatile u32*) FEEDERA_DMA_CSR_BASE;
  dmaA.desc = (volatile u32*) FEEDERA_DMA_DESCRIPTOR_SLAVE_BASE;
  dmaB.base = (volatile u32*) FEEDERB_DMA_CSR_BASE;
  dmaB.desc = (volatile u32*) FEEDERB_DMA_DESCRIPTOR_SLAVE_BASE;
  dmaR.base = (volatile u32*) RESULTSDMA_CSR_BASE;
  dmaR.desc = (volatile u32*) RESULTSDMA_DESCRIPTOR_SLAVE_BASE;

  // reset DMA
  dmaA.base[1] |= 2;
  dmaB.base[1] |= 2;
  dmaR.base[1] |= 2;

  // wait for reset to complete
  while ((dmaA.base[0] & (1 << 6)));
  while ((dmaB.base[0] & (1 << 6)));
  while ((dmaR.base[0] & (1 << 6)));

  // Q transfers to and from the Multiplier
  qStreamFrom(&dmaR, C, SIZE * 4);
  qStreamTo(&dmaA, A, SIZE * 2);
  qStreamTo(&dmaB, B, SIZE * 2);

  // wait for sending to complete
  while (dmaA.base[0] & 0x1);
  while (dmaB.base[0] & 0x1);
  while (dmaR.base[0] & 0x1);

  int col = 0;
  for (int i = 0; i < SIZE; i++) {
    printf("%8d, ", (unsigned int)C[i]);
    if (++col == DIM) {
      puts("");
      col = 0;
    }
  }
}
