/* Copyright (C) 2013  Mastermind_X

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    To contact the author of this work, e-mail him at lol.lol.lol@meine-dateien.info*/

#include "gba.h"
#include "background.h"
#include "lz77.h"
#include "tiles.h"

u32 INTERRUPTSAVE0;
u32 INTERRUPTSAVE1;
u32 INTERRUPTSAVE2;
u32 INTERRUPTSAVE3;
u16 MOVEFLAG, STEPS, CARRYFLAG, ABUTTON, BBUTTON;
u16 DESTX, DESTY, CURX, CURY;
u16 SAVEBGCNT, SAVEDSPCNT;
u8 DATAX, DATAY;
u8 CURRENTTILE;
u16 x;
u8 puzzleNumberToLoad;

#include "gba_oam.h"
#include "main.h"

int main() {
	
	CURRENTTILE = 0;
	CARRYFLAG = 0;
	MOVEFLAG = 0;
	STEPS = 0;
	DESTX = 72;
	DESTY = 44;
	CURX = 71;
	CURY = 43;
	DATAX = 1;
	DATAY = 1;
	
	puzzleNumberToLoad = inputLevel;
	
	SAVEBGCNT = REG_BG0CNT;
	SAVEDSPCNT = REG_DISPCNT;

	INTERRUPTSAVE0 = *interrupt;
	INTERRUPTSAVE1 = *(interrupt+1);
	INTERRUPTSAVE2 = *(interrupt+2);
	INTERRUPTSAVE3 = *(interrupt+3);
	*interrupt = 0;
	*(interrupt+1) = 0;
	*(interrupt+2) = 0;
	*(interrupt+3) = 0;
	x = 0;
	while (x<1889) {
		*(save1+x)=*(FrontBuffer+x);
		x++;
	}
	x = 0;
	while (x<2049) {
		*(save2+x)=*(OAM_Data+x);
		x++;
	}
	
	REG_BG0CNT = 0;
	
	initializeBackground(); 		//Load background graphics into VRAM
	initializeSprites();			//Load sprite graphics into VRAM
	initializeConfig(puzzleNumberToLoad); 	//Initializes the configuration file depending on which puzzle we wish to load.
	initializeTiles(puzzleNumberToLoad);  	//Loads the appropriate tile OAMs
	setTileGFX();
	
	REG_BG0CNT = BG_COLOR_16 | TEXTBG_SIZE_256x256 | (8 << SCREEN_SHIFT) | (0 << CHAR_SHIFT) | 3; //Set up IO Flags
	
	while (!Win()) //Our Main Loop
	{
		SetMode(MODE_1 | BG0_ENABLE | OBJ_ENABLE | OBJ_MAP_1D); //Set render mode
		while (MOVEFLAG) {
			step();
			vsync();
			CopyOAM();
		}
		getKeyInput();
		vsync();
		CopyOAM();
		if (BBUTTON) {
			inputLevel = 0;
			goto Exit;
		}
	}
	
	sprites[0].attribute0 = 160;
	sprites[0].attribute1 = 240;
	sprites[0].attribute2 = 0;
	CopyOAM();
	
	while (ABUTTON) {
		if (!keyDown(KEY_A)) {
			ABUTTON = 0;
		}
	}
	
	while (!(keyDown(KEY_A))) {
		vsync();
		CopyOAM();
	}
	
	inputLevel = 1;

	Exit:
	x = 0;
	while (x < 2049) {
		*(OAM_Data+x)=*(save2+x);
		x++;
	}
	BBUTTON = 0;
	x = 0;
	while (x < 1889) {
		*(FrontBuffer+x)=*(save1+x);
		x++;
	}
	
	REG_BG0CNT = SAVEBGCNT;
	REG_DISPCNT = SAVEDSPCNT;
	*interrupt = INTERRUPTSAVE0;
	*(interrupt+1) = INTERRUPTSAVE1;
	*(interrupt+2) = INTERRUPTSAVE2;
	*(interrupt+3) = INTERRUPTSAVE3;
	

	x = 0;
	while (x<1889) {
		*(save1+x)=0;
		x++;
	}
	x = 0;
	while (x<2049) {
		*(save2+x)=0;
		x++;
	}
	x = 0;
	while (x<0x1000) {
		*(lzData+x)=0;
		x++;
	}
	x = 0;
	while (x<0x1000) {
		*(lzData2+x)=0;
		x++;
	}
	
	return 1;
}
