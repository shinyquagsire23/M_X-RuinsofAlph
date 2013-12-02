//
// Test input from buttons
//
 
#ifndef GBA_KEYS_H
#define GBA_KEYS_H
 
#include "gba_types.h"
 
#define KEY_A      0x01
#define KEY_B      0x02
#define KEY_SELECT 0x04
#define KEY_START  0x08
#define KEY_RIGHT  0x10
#define KEY_LEFT   0x20
#define KEY_UP     0x40
#define KEY_DOWN   0x80
#define KEY_R      0x01
#define KEY_L      0x02
 
#define KEYS         *(volatile u8*)0x030022EE
#define KEYSHOLD     *(volatile u8*)0x030022EC
 
//Use like this: if(keyPressed(KEY_A)) {};
#define keyPressed(k)    (KEYS & k)
#define keyHeldDown(k)   (KEYSHOLD & k)

#define KEYSLR       *(volatile u8*)0x030022EF
#define KEYSHOLDLR   *(volatile u8*)0x030022ED

#define keyPressedLR(k)  (KEYSLR & k)
#define keyHeldDownLR(k) (KEYSHOLDLR & k)
 
#endif
