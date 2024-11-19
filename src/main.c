#include <registers.h>
#include <gpucmd.h>

// TODO: what do I do with this?
void printf(const char *, ...);

#define SCREEN_W 256
#define SCREEN_H 240

int _start()
{
    printf("Hi!\n");

    GPU_GP1 = gp1_resetGPU();
    GPU_GP1 = gp1_dmaRequestMode(GP1_DREQ_GP0_WRITE);
    GPU_GP1 = gp1_dispBlank(false);
    GPU_GP1 = gp1_fbMode(GP1_HRES_256, GP1_VRES_256, GP1_MODE_NTSC, false, GP1_COLOR_16BPP);
    GPU_GP0 = gp0_fbMask(false, false);
    GPU_GP0 = gp0_fbOffset1(0, 0);
    GPU_GP0 = gp0_fbOffset2(1023, 511);
    GPU_GP0 = gp0_fbOrigin(SCREEN_W / 2, SCREEN_H / 2);

    // TODO: probably sync here

    GPU_GP0 = gp0_rgb(255, 0, 0) | _gp0_polygon(false, false, true, false, false);
    GPU_GP0 = gp0_xy(0, -40);
    GPU_GP0 = gp0_rgb(0, 255, 0);
    GPU_GP0 = gp0_xy(-40, 40);
    GPU_GP0 = gp0_rgb(0, 0, 255);
    GPU_GP0 = gp0_xy(40, 40);
    
    for (;;);
}
