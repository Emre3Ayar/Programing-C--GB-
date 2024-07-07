#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "BTW.c"
#include "Currency.c"
#include "TIMER.c"
#include <stdbool.h>
//#include "CarLogo.c"
//#include "SmilerSprites.c"
#include "Export.c"

extern UINT8 savefile;
extern UINT8 EUR[];
extern UINT8 saveTimer[];
char* SS[4] = {"0","Currency Convert\n\n -->","BTW\n\n <-- -->","Timer\n\n <--"};
void selectionScreen(UINT8 S){
  printf("--------------------");
  printf("\n\n");
  printf("Select Program:\n\n\n %s", SS[S+1]);
  printf("\n\n\n");
  printf("\n\n\n\n\n--------------------");
}
void main(){
  NR52_REG = 0x80;// sound on
  NR50_REG = 0x07;// volume set
  NR51_REG = 0xFF;
  ENABLE_RAM_MBC1;
  //saving
  // if (savefile == 0xFF) {
  //   printf("no save file %d", savefile);
  // }
  // else
  // {
  //   printf("save file %d", savefile);
  // }
  bool sele = false;
  short S = 0;
  //timer
  UINT8 countTimer = 0;
  if (saveTimer[0] != 0xFF) {
      r[0] = saveTimer[0];
      r[1] = saveTimer[1];
      r[2] = saveTimer[2];
    }
    else
    {
      r[0] = 0x0;
      r[1] = 0x0;
      r[2] = 0x0;
    }
  selectionScreen(S);
    set_sprite_data(0, 1, TileLabel);
    set_sprite_tile(0, 0);
    move_sprite(0, 88, 78);
    //SHOW_SPRITES;
    set_sprite_tile(0, 0);
    while(1){
      //Selection screen
      while (!sele) {
        if (J_RIGHT & joypad()) {
          if (S < 2) {
            S++;
            cls();
            selectionScreen(S);
          }
        }
        else if (J_LEFT & joypad()) {
          if (S != 0) {
            S--;
            cls();
            selectionScreen(S);
          }
        }
        else if (J_START & joypad()) {
          savefile = 0x2;
          cls();
          if (S == 1) {
            btwScreen();
          }
          if (S == 0) {
            currencyScreen();
          }
          if (S == 2) {
            timerScreen();
          }
          sele = true;
        }
        delay(500);
      }
      while(sele){
        while(S == 1 && sele) {
          btwJoy();
          if (J_SELECT & joypad()) {
            //sele = 0;
            cls();
            selectionScreen(S);
            sele = false;
          }
        }
        while(S == 2 && sele) {
          timerJoy();
          if (J_SELECT & joypad()) {
            //sele = 0;
            cls();
            selectionScreen(S);
            sele = false;
          }
        }
        while(S == 0 && sele) {
          currencyJoy();
          if (J_SELECT & joypad()) {
            //sele = 0;
            cls();
            selectionScreen(S);
            sele = false;
          }
        }
      }
      //timer screen
      // while (sele == 1) {
      //   cls();
      //   timerSystem();
      //   timerScreen();
      //   countTimer++;
      //   if (J_SELECT & joypad()) {
      //     sele = 0;
      //     saveTimer[0] = r[0];
      //     saveTimer[1] = r[1];
      //     saveTimer[2] = r[2];
      //     cls();
      //     selectionScreen(S);
      //   }
      //   if (J_A & joypad()) {
      //     r[0] = 0x0;
      //     r[1] = 0x0;
      //   r[2] = 0x0;
      //     cls();
      //     timerScreen();
      //   }
      //   delay(1000);
      // }
      DISABLE_RAM_MBC1;
    }
}
