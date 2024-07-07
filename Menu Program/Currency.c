#include <gb/gb.h>
#include <stdio.h>

UINT8 amount = 0;
extern UINT8 EUR[];
void currencyScreen(){
  printf("$$$$$$$$$$$$$$$$$$$$");
  printf("\n\n");
  printf("   Amount to \n   Convert: %d", amount);
  printf("\n\n");
  printf(" ");
  printf("\n\n\n\n\n Made By\n\n  Emre Ayar\n  Speedysm1des\n\n$$$$$$$$$$$$$$$$$$$$");
}
void currencyJoy(){
  if (J_DOWN & joypad()) {
    amount--;
    cls();
    currencyScreen();
  }
  else if (J_UP & joypad()) {
    amount++;
    cls();
    currencyScreen();
  }
  delay(500);
}
