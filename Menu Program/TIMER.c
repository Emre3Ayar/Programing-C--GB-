#include <gb/gb.h>
#include <stdio.h>
#include "shared.h"

UINT8 countTimer = 0;
extern UINT8 saveTimer[];
UINT8 stopCount = 0;
void timerScreen(){
  //UINT8 r[] = {0,0,0};
  //UINT8 r[] = timerSystem(89);
  printf("--------------------");
  printf("\n\n");
  printf("   Seconds: %d\n   Minutes: %d\n   Uren: %d\n\n\n  A: Stop\n  B: Reset" , r[0], r[1], r[2]);
  printf("\n\n\n");
  printf(" Made By\n\n  Emre Ayar\n  Speedysm1des\n--------------------");
}
void timerJoy(){
  if (J_A & joypad()) {
    r[0] = 0x0;
    r[1] = 0x0;
    r[2] = 0x0;
  }
  if (J_B & joypad()) {
    stopCount++;
  }
  else if (J_START & joypad()) {
    saveTimer[0] = r[0];
    saveTimer[1] = r[1];
    saveTimer[2] = r[2];
  }
  cls();
  if (stopCount % 2 == 0) {
    timerSystem();
  }
  timerScreen();
  delay(1000);
}
UINT8* timerSystem(){
  r[0]++;
  NR10_REG = 00010011;
  NR11_REG = 0x40;
  NR12_REG = 0x73;
  NR13_REG = 0x00;
  NR14_REG = 0xC3;
  if (r[0x0] % 60 == 0) {
    r[0x1]++;
    r[0x0] = 0;
    if (r[0x1] % 60 == 0) {
      r[0x1] = 0;
      r[0x2]++;
    }
  }
  UINT8 n = r[0x0] % 60;
  //UINT8 m = tt;

  UINT8 u = n / 60;
  return 0;
}
