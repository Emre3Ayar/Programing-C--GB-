#include <gb/gb.h>
#include <stdio.h>

UINT8 s = 0;
UINT8 b[] = {6,12,21};
UINT8 j = 0;
UINT8 l = sizeof(b);
void btwScreen(){
  printf("^^^^^^^^^^^^^^^^^^^^");
  printf("\n\n");
  printf("   Bedrag: %d", j);
  printf("\n\n\n");
  printf("   BTW Percent: %d", b[s]);
  printf("\n\n\n\n\n\n Made By\n\n  Emre Ayar\n  Speedysm1des\n^^^^^^^^^^^^^^^^^^^^");
}
void btwJoy(){
  if (J_DOWN & joypad()) {
    j--;
    cls();
    btwScreen();
  }
  else if (J_UP & joypad()) {
    j++;
    cls();
    btwScreen();
  }
  else if (J_RIGHT & joypad()) {
    if (s < l && s != l) {
      s++;
    }
    cls();
    btwScreen();
  }
  else if (J_LEFT & joypad()) {
    if (s > 0) {
      s--;
    }
    cls();
    btwScreen();
  }
  else if (J_START & joypad()) {
    cls();
    result();
  }
  else if (J_A & joypad()) {
    j = j + 10;
    cls();
    btwScreen();
  }
  else if (J_B & joypad()) {
    j = j - 10;
    cls();
    btwScreen();
  }
  delay(500);
}
UINT8 getEenheid(UINT8 n){
  return n % 10;
}
UINT8 getTiental(UINT8 n){
  return (n / 10) % 10;
}
UINT8 getHonderdtal(UINT8 n){
  return (n / 100) % 10;
}
void result(){
  //UINT8 r = p % 10;
  printf("--------------------");
  //16 rijen
  //printf("%d BTW of %d is %d",btw ,p,r);

  UINT8 e = getEenheid(j);
  UINT8 t = getTiental(j);
  UINT8 h = getHonderdtal(j);
  //
  UINT8 v = e*b[s];
  UINT8 vv = t*b[s];
  UINT8 vvv = h*b[s];

  UINT8 een = getEenheid(vv) + getTiental(v);
  UINT8 twee = getTiental(een) + getHonderdtal(v) + getTiental(vv) + getEenheid(vvv);
  UINT8 drie = getTiental(twee) + getHonderdtal(vv) + getTiental(vvv);
  UINT8 vier = getTiental(drie) + getHonderdtal(vvv);
  //UINT8 tt = t * btw
  printf("\n\n\n  %d % Percent BTW\n\n  %d Bedrag excl. \n____________________  \n  BTW bedrag %d%d%d,%d%d",b[s] ,j,vier,getEenheid(drie),getEenheid(twee),getEenheid(een),getEenheid(v));
  printf("\n\n\n\n\n\n--------------------");
}
