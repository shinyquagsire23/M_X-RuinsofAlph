#include "include/gba.h"
#include "background.h"
#include "tiles.h"

#define Tiles   ((u16 *) 0x6000000)
#define MapData ((u16 *) 0x6004000)
#define BG1Data ((u16 *) 0x6008000)
#define BG2Data ((u16 *) 0x600F000)
#define OBJData ((u16 *) 0x6010000)
#define MenuBG  ((u16 *) 0x600F800)

#define Y(tile) (sprites[tile].attribute0)
#define X(tile) (sprites[tile].attribute1)
#define Z(tile) (sprites[tile].attribute2)

#define BackupData  ((u16 *) 0x2058000)
#define BackupData2 ((u16 *) 0x2059000)
#define BackupData3 ((u16 *) 0x2059600)

#define LASTRESULT  (*(u8 *) 0x20375F0)

// 43 bytes for global variables
#define GLOBALVARS 0x2057600

#define MOVEFLAG    (*((u16 *) (GLOBALVARS + 0)))
#define STEPS       (*((u16 *) (GLOBALVARS + 2)))
#define CARRYFLAG   (*((u16 *) (GLOBALVARS + 4)))
#define ABUTTON     (*((u16 *) (GLOBALVARS + 6)))
#define BBUTTON     (*((u16 *) (GLOBALVARS + 8)))
#define DATAX       (*((u8  *) (GLOBALVARS + 10)))
#define DATAY       (*((u8  *) (GLOBALVARS + 11)))
#define CURRENTTILE (*((u8  *) (GLOBALVARS + 12)))
#define TILECONFIG  ( ((u8  *) (GLOBALVARS + 13)))

#define MAXPEOPLE 3

OAMEntry *sprites = ((OAMEntry *) 0x030022F8);

u16 Win();

u16 main() {
	CURRENTTILE = 0;
	STEPS = 0;
	CARRYFLAG = MOVEFLAG = 0;
	DATAX = DATAY = 1;
	ABUTTON = 1;
	BBUTTON = 0;
	REG_DISPCNT = 0;
	u32 counter = 0;
	
	// unfadeScreen();
	
	backup();
	initBG();
	initConfig(LASTRESULT);
	initTiles(LASTRESULT);
	setTileGFX();
	initVideo();
	
	// Our Main Loop
	while (!Win()) {
		getKeyInput();
		pixieDust();
		
		if(!CARRYFLAG) {
			if(counter < 5000) {
				counter++;
				Z(0) = PRIORITY(0) | 256;
			} else if(counter < 10000) {
				counter++;
				Z(0) = PRIORITY(0) | 512;
			} else
				counter = 0;
		} else
			counter = 0;
		
		if (BBUTTON) {
			LASTRESULT = 0;
			break;
		}
	}
	
	pixieDust();
	
	if(!BBUTTON) {
		Y(0) = 160;
		X(0) = 240;
		Z(0) = 0;
		
		while (ABUTTON && keyDown(KEY_A)); // Ignore A until the player releases it
		while (!keyDown(KEY_A));           // Wait until the player presses A
		
		LASTRESULT = 1;
	}
	
	REG_DISPCNT = 0;
	
	// unfadeScreen();
	restore();
	
	return 1;
}

#include "include/gba_compress.h"
#include "useful.h"

void backup() {
	u16 i;
	
	for(i = 0 ; i < 0x1000 ; i++)
		BackupData[i] = Tiles[i];
	
	for(i = 0 ; i < 0x300 ; i++)
		BackupData2[i] = MapData[i];
	
	for(i = 0 ; i < 9 ; i++)
		BackupData3[i] = OBJ_PaletteMem[i];
	
	for(i = 0 ; i < 9 ; i++)
		BackupData3[i + 9] = BG_PaletteMem[i];
	
	for(i = 0 ; i < 0xC0 * MAXPEOPLE ; i++)
		BackupData3[i + 18] = OBJData[i];
	
	for(u16 i = 0 ; i < 128 ; i++) {
		Y(i) = 160;
		X(i) = 240;
		Z(i) = 0;
	}
}

void restore() {
	u16 i;
	
	for(u8 i = 0 ; i <= 16 ; i++) {
		Y(i) = 160;
		X(i) = 240;
		Z(i) = 0;
	}
	
	for(i = 0 ; i < 0x1000 ; i++)
		Tiles[i] = BackupData[i];
	
	for(i = 0 ; i < 0x300 ; i++)
		MapData[i] = BackupData2[i];
	
	for(i = 0 ; i < 9 ; i++) {
		OBJ_PaletteMem [i] = BackupData3[i];
		OBJ_PaletteMem2[i] = BackupData3[i];
	}
	
	for(i = 0 ; i < 9 ; i++) {
		BG_PaletteMem [i] = BackupData3[i + 9];
		BG_PaletteMem2[i] = BackupData3[i + 9];
	}
	
	for(i = 0 ; i < 0xC0 * MAXPEOPLE ; i++)
		OBJData[i] = BackupData3[i + 18];
	
	for(i = 0 ; i < 0x400 ; i++)
		MenuBG[i] = 0;
	
	BG0CNT      = (31 << SCREEN_SHIFT) | 8;
	REG_DISPCNT = MODE_0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE | OBJ_ENABLE | OBJ_MAP_1D;
}

void initVideo() {
	REG_DISPCNT = MODE_0 | BG0_ENABLE | OBJ_ENABLE | OBJ_MAP_1D;
	BG0CNT      = (8 << SCREEN_SHIFT) | 3;
}

void initBG() {
	u16 x = 651, y = 611;
	
	for(u16 i = 0 ; i < 9 ; i++)
		BG_PaletteMem[i] = BG_PaletteMem2[i] = background_Palette_diff[i];
	
	LZ77UnCompVram(background_Tiles, Tiles);
	LZ77UnCompVram(background_Map,   MapData);
	
	while (x > 1) {
		x--;
		y--;
		
		u16 ycopy = y;
		
		while(ycopy >= 30)
			ycopy -= 30;
		
		if (ycopy == 0)
			x -= 2;
		
		MapData[x - 1] = MapData[y - 1];
	}
}

void *memcpy(void *dest, const void *src, u32 n) {
	for(u32 i = 0 ; i < n ; i++)
		((char *) dest)[i] = ((const char *) src)[i];
	
	return dest;
}

void initConfig(u8 puzzleNumber) {
	u8 config0[30] = {
		0x09, 0x05, 0x00, 0x00, 0x0C, 0x00,
		0x10, 0x00, 0x00, 0x00, 0x00, 0x03,
		0x00, 0x0E, 0x04, 0x02, 0x00, 0x00,
		0x0D, 0x00, 0x00, 0x07, 0x0A, 0x00,
		0x01, 0x08, 0x0B, 0x06, 0x00, 0x0F
	};
	
	u8 config1[30] = {
		0x04, 0x0E, 0x00, 0x0C, 0x03, 0x08,
		0x0A, 0x02, 0x06, 0x10, 0x00, 0x00,
		0x00, 0x09, 0x00, 0x00, 0x00, 0x00,
		0x05, 0x00, 0x07, 0x01, 0x0F, 0x00,
		0x00, 0x0D, 0x00, 0x0B, 0x00, 0x00
	};
	
	u8 config2[30] = {
		0x01, 0x0E, 0x00, 0x05, 0x10, 0x06,
		0x0B, 0x00, 0x00, 0x0D, 0x00, 0x00,
		0x00, 0x07, 0x00, 0x00, 0x02, 0x00,
		0x00, 0x00, 0x08, 0x04, 0x00, 0x0A,
		0x09, 0x0C, 0x03, 0x00, 0x00, 0x0F
	};
	
	u8 config3[30] = {
		0x03, 0x00, 0x00, 0x04, 0x00, 0x08,
		0x0B, 0x06, 0x00, 0x00, 0x0E, 0x00,
		0x07, 0x00, 0x09, 0x01, 0x00, 0x00,
		0x0F, 0x02, 0x0D, 0x00, 0x00, 0x00,
		0x05, 0x00, 0x00, 0x10, 0x0A, 0x0C
	};
	
	if(puzzleNumber == 0)
		memcpy(TILECONFIG, config0, 30);
	else if(puzzleNumber == 1)
		memcpy(TILECONFIG, config1, 30);
	else if(puzzleNumber == 2)
		memcpy(TILECONFIG, config2, 30);
	else
		memcpy(TILECONFIG, config3, 30);
}

void initTiles(u8 puzzleNumber) {
	Y(0) = 55;                //set y-coordinate
	X(0) = SIZE_32 | 71;      //set size and x-coordinate
	Z(0) = PRIORITY(0) | 512; //where in VRAM we get the tile data from
	
	for(u8 i = 0 ; i < 9 ; i++) {
		OBJ_PaletteMem [i] = tiles_palette[i];
		OBJ_PaletteMem2[i] = tiles_palette[i];
	}
	
	if(puzzleNumber == 0)
		LZ77UnCompVram(tileset00_data, OBJData);
	else if(puzzleNumber == 1)
		LZ77UnCompVram(tileset01_data, OBJData);
	else if(puzzleNumber == 2)
		LZ77UnCompVram(tileset02_data, OBJData);
	else
		LZ77UnCompVram(tileset03_data, OBJData);
	
	LZ77UnCompVram(pointer_data, OBJData + 0x2000);
}

const u8 coordsX[30] = {
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1
};

const u8 coordsY[30] = {
	0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
	0x38, 0x38, 0x38, 0x38, 0x38, 0x38,
	0x50, 0x50, 0x50, 0x50, 0x50, 0x50,
	0x68, 0x68, 0x68, 0x68, 0x68, 0x68,
	0x80, 0x80, 0x80, 0x80, 0x80, 0x80
};

u16 getTilePos(u8 tileNumber) {
	for(u32 i = 0 ; i < 30 ; i++)
		if((TILECONFIG[i] & 0x7F) == tileNumber)
			return i;
	
	return 0;
}

void setTileGFX() {
	for(u8 i = 1 ; i <= 16 ; i++) {
		u16 position = getTilePos(i);
		Y(i) = coordsY[position];
		X(i) = SIZE_32 | coordsX[position];
		Z(i) = PRIORITY(1) | (i - 1) * 16;
	}
}

void getKeyInput() {	
	if keyDown(KEY_RIGHT) {
		if (DATAX < 5) {				
			X(CURRENTTILE) -= coordsX[DATAY*6+DATAX];
			
			if(CURRENTTILE != 0)
				X(0) -= coordsX[DATAY*6+DATAX];
			
			DATAX++;
			
			X(CURRENTTILE) += coordsX[DATAY*6+DATAX];
			
			if(CURRENTTILE != 0)
				X(0) += coordsX[DATAY*6+DATAX];
		}
		
		while(keyDown(KEY_RIGHT));
	}
	if keyDown(KEY_LEFT) {
		if (DATAX > 0) {
			X(CURRENTTILE) -= coordsX[DATAY*6+DATAX];
			
			if(CURRENTTILE != 0)
				X(0) -= coordsX[DATAY*6+DATAX];
			
			DATAX--;
			
			X(CURRENTTILE) += coordsX[DATAY*6+DATAX];
			
			if(CURRENTTILE != 0)
				X(0) += coordsX[DATAY*6+DATAX];
		}
		
		while(keyDown(KEY_LEFT));
	}
	if keyDown(KEY_DOWN) {
		if (DATAY < 4) {
			Y(CURRENTTILE) -= coordsY[DATAY*6+DATAX];
			
			if(CURRENTTILE != 0)
				Y(0) -= coordsY[DATAY*6+DATAX];
			
			DATAY++;
			
			if(CURRENTTILE != 0)
				Y(CURRENTTILE) += coordsY[DATAY*6+DATAX];
			
			Y(0) += coordsY[DATAY*6+DATAX];
		}
		
		while(keyDown(KEY_DOWN));
	}
	if keyDown(KEY_UP) {
		if (DATAY > 0) {
			Y(CURRENTTILE) -= coordsY[DATAY*6+DATAX];
			
			if(CURRENTTILE != 0)
				Y(0) -= coordsY[DATAY*6+DATAX];
			
			DATAY--;
			
			if(CURRENTTILE != 0)
				Y(CURRENTTILE) += coordsY[DATAY*6+DATAX];
			
			Y(0) += coordsY[DATAY*6+DATAX];
		}
		
		while(keyDown(KEY_UP));
	}
	
	if keyDown(KEY_A) {
		if (!ABUTTON) {
			if (CARRYFLAG) {
				if (TILECONFIG[DATAY*6+DATAX] == 0) {
					TILECONFIG[DATAY*6+DATAX] = CURRENTTILE;
					sprites[CURRENTTILE].attribute2 = PRIORITY(1) | (sprites[CURRENTTILE].attribute2 & 0x3FF);
					CURRENTTILE = 0;
					CARRYFLAG = 0;
					ABUTTON = 1;
					Z(0) = PRIORITY(0) | 512;
				}
			}
			else {
				if (TILECONFIG[DATAY*6+DATAX] != 0) {
					CURRENTTILE = TILECONFIG[DATAY*6+DATAX];
					TILECONFIG[DATAY*6+DATAX] = 0;
					CARRYFLAG = 1;
					sprites[CURRENTTILE].attribute2 = PRIORITY(0) | (sprites[CURRENTTILE].attribute2 & 0x3FF);
					ABUTTON = 1;
					Z(0) = PRIORITY(3) | 512;
				}
			}
		}
	}
	
	if (!keyDown(KEY_A))
		ABUTTON = 0;
	
	if keyDown(KEY_B)
		BBUTTON = 1;
}

u16 Win() {
	const u8 win[30] = {
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x01, 0x02, 0x03, 0x04, 0x00,
		0x00, 0x05, 0x06, 0x07, 0x08, 0x00,
		0x00, 0x09, 0x0A, 0x0B, 0x0C, 0x00,
		0x00, 0x0D, 0x0E, 0x0F, 0x10, 0x00
	};
	
	for(u8 i = 0 ; i < 30 ; i++)
		if(TILECONFIG[i] != win[i])
			return 0;
		
	return 1;
}
