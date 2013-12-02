#include "include/gba.h"
#include "background.h"
#include "tiles.h"

#define Tiles   ((u16 *) 0x6000000)
#define MapData ((u16 *) 0x6004000)
#define BG1Data ((u16 *) 0x6008000)
#define BG2Data ((u16 *) 0x600F000)
#define OBJData ((u16 *) 0x6010000)
#define MenuBG  ((u16 *) 0x600F800)

#define objYHeight(tile) (sprites[tile].attribute0)
#define objXSize(tile) (sprites[tile].attribute1)
#define objPalTile(tile) (sprites[tile].attribute2)

#define LASTRESULT		(*(u16 *) 0x20375F0)
#define var8004			(*(u16 *) 0x20375E0)
#define fadeScreenDone	(*(u8 *) 0x02037FDB)

#define TMPSTRPTRADDR	((u32 *) 0x0203BCD0)
#define globalVars		(*((u32 *) TMPSTRPTRADDR))
#define counter			(*(u32 *) (globalVars + 0))
#define moveFlag		(*(u16 *) (globalVars + 4))
#define steps			(*(u16 *) (globalVars + 6))
#define carryFlag		(*(u16 *) (globalVars + 8))
#define AButton			(*(u16 *) (globalVars + 10))
#define BButton			(*(u16 *) (globalVars + 12))
#define dataX			(*(u8  *) (globalVars + 14))
#define dataY			(*(u8  *) (globalVars + 15))
#define currentTile		(*(u8  *) (globalVars + 16))
#define currentLoop		(*(u8  *) (globalVars + 17))
#define tileConfig		((u8  *) (globalVars + 18))

#define MAXPEOPLE 3

#define EMPTYMOVESOUND 0x05
#define TILEMOVESOUND  0x23
#define ERRORSOUND     0x20
#define TAKETILESOUND  0x24
#define DROPTILESOUND  0x2C
#define WINSONG        0x186

OAMEntry *sprites = ((OAMEntry *) 0x030022F8);

u16 Win();
void init2();
void init3();
void main();
void updateEverything2();

void init() {

	storeCallback((void *) init2 + 1);
	
}

void init2() {

	storeCallback2(0);

	int (*func)(u32) = (int (*)(u32))0x08000B39;
	globalVars = func(0x30);

	currentTile = 0;
	steps = 0;
	carryFlag = moveFlag = 0;
	dataX = dataY = 1;
	AButton = 1;
	BButton = 0;
	counter = 0;
	currentLoop = 0;

	initBG();
	initConfig(var8004);

	vsync();

	initTiles(var8004);
	setTileGFobjXSize();
	initVideo();
	unfadeScreen();
	
	storeCallback((void *) main + 1);
	storeCallback2((void *) updateEverything2 + 1);
}

void init3() {
	for(int i=0x10;i<0x20;i+=2) changeIO(i,0);
	
	clearOAM();
	
}

void main() {	// The main loop

	if (currentLoop == 0) {
		if (fadeScreenDone == 0)
			currentLoop++;
	}
	
	else if (currentLoop == 1) {
		if (!Win()) {
			if(!carryFlag) {
				if(counter < 5000) {
					counter++;
					objPalTile(0) = PRIORITY(0) | 256;
				} else if(counter < 10000) {
					counter++;
					objPalTile(0) = PRIORITY(0) | 512;
				} else
					counter = 0;
			} else
				counter = 0;
			
			if (BButton) {
				LASTRESULT = 0;
				fadeScreen();
				currentLoop++;
			}
			
			getKeyInput();
		}
		
		else {
			objYHeight(0) = 160;
			objXSize(0) = 240;
			objPalTile(0) = 0;
			
			while (AButton && keyDown(KEY_A));          // Ignore A until the player releases it
			while (!keyDown(KEY_A) && !keyDown(KEY_B)); // Wait until the player presses A or B
			
			LASTRESULT = 1;
			fadeScreen();
			currentLoop++;
		}
	}
	
	else if (currentLoop == 2) {
		if (fadeScreenDone == 0)
			storeCallback(0x080861CD);
	}
	
	updateEverything();

}

#include "include/gba_compress.h"
#include "useful.h"

void initVideo() {

	changeIO(0,MODE_0 | OBJ_ENABLE | OBJ_MAP_1D);
	
	enableBG(0);
	
	changeIO(8,(8 << SCREEN_SHIFT) | 3);
	
}

void initBG() {
	u16 x = 651, y = 611;
	
	for(u16 i = 0 ; i < 9 ; i++)
		BG_PaletteMem[i] = background_Palette[i];
	
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
		memcpy(tileConfig, config0, 30);
	else if(puzzleNumber == 1)
		memcpy(tileConfig, config1, 30);
	else if(puzzleNumber == 2)
		memcpy(tileConfig, config2, 30);
	else
		memcpy(tileConfig, config3, 30);
}

void initTiles(u8 puzzleNumber) {
	objYHeight(0) = 55;                //set y-coordinate
	objXSize(0) = SIZE_32 | 71;      //set size and x-coordinate
	objPalTile(0) = PRIORITY(0) | 512; //where in VRAM we get the tile data from
	
	for(u8 i = 0 ; i < 9 ; i++) {
		OBJ_PaletteMem [i] = tiles_palette[i];
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
		if((tileConfig[i] & 0x7F) == tileNumber)
			return i;
	
	return 0;
}

void setTileGFobjXSize() {
	for(u8 i = 1 ; i <= 16 ; i++) {
		u16 position = getTilePos(i);
		objYHeight(i) = coordsY[position];
		objXSize(i) = SIZE_32 | coordsX[position];
		objPalTile(i) = PRIORITY(1) | (i - 1) * 16;
	}
}

void getKeyInput() {
	if(keyDown(KEY_RIGHT)) {
		if (dataX < 5) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else
				playSound(EMPTYMOVESOUND);
			
			objXSize(currentTile) -= coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXSize(0) -= coordsX[dataY*6+dataX];
			
			dataX++;
			
			objXSize(currentTile) += coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXSize(0) += coordsX[dataY*6+dataX];
		}
		
		while(keyDown(KEY_RIGHT));
	} else if(keyDown(KEY_LEFT)) {
		if (dataX > 0) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else
				playSound(EMPTYMOVESOUND);
			
			objXSize(currentTile) -= coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXSize(0) -= coordsX[dataY*6+dataX];
			
			dataX--;
			
			objXSize(currentTile) += coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXSize(0) += coordsX[dataY*6+dataX];
		}
		
		while(keyDown(KEY_LEFT));
	} else if(keyDown(KEY_DOWN)) {
		if (dataY < 4) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else
				playSound(EMPTYMOVESOUND);
			
			objYHeight(currentTile) -= coordsY[dataY*6+dataX];
			
			if(currentTile != 0)
				objYHeight(0) -= coordsY[dataY*6+dataX];
			
			dataY++;
			
			if(currentTile != 0)
				objYHeight(currentTile) += coordsY[dataY*6+dataX];
			
			objYHeight(0) += coordsY[dataY*6+dataX];
		}
		
		while(keyDown(KEY_DOWN));
	} else if(keyDown(KEY_UP)) {
		if (dataY > 0) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else
				playSound(EMPTYMOVESOUND);
			
			objYHeight(currentTile) -= coordsY[dataY*6+dataX];
			
			if(currentTile != 0)
				objYHeight(0) -= coordsY[dataY*6+dataX];
			
			dataY--;
			
			if(currentTile != 0)
				objYHeight(currentTile) += coordsY[dataY*6+dataX];
			
			objYHeight(0) += coordsY[dataY*6+dataX];
		}
		
		while(keyDown(KEY_UP));
	} else if(keyDown(KEY_A)) {
		if (!AButton) {
			if (carryFlag) {
				AButton = 1;
				if (tileConfig[dataY*6+dataX] == 0) {
					playSound(DROPTILESOUND);
					tileConfig[dataY*6+dataX] = currentTile;
					sprites[currentTile].attribute2 = PRIORITY(1) | (sprites[currentTile].attribute2 & 0x3FF);
					currentTile = 0;
					carryFlag = 0;
					objPalTile(0) = PRIORITY(0) | 512;
				} else
					playSound(ERRORSOUND);
			}
			else {
				AButton = 1;
				if (tileConfig[dataY*6+dataX] != 0) {
					playSound(TAKETILESOUND);
					currentTile = tileConfig[dataY*6+dataX];
					tileConfig[dataY*6+dataX] = 0;
					carryFlag = 1;
					sprites[currentTile].attribute2 = PRIORITY(0) | (sprites[currentTile].attribute2 & 0x3FF);
					AButton = 1;
					objPalTile(0) = PRIORITY(3) | 512;
				} else
					playSound(ERRORSOUND);
			}
		}
	}
	
	if (!keyDown(KEY_A))
		AButton = 0;
	
	if(keyDown(KEY_B)) {
		BButton = 1;
	}
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
		if(tileConfig[i] != win[i])
			return 0;
	
	playSong(WINSONG);
	return 1;
}