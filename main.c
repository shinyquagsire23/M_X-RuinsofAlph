#include "include/gba.h"
#include "background.h"
#include "tiles.h"

#define Tiles   ((u16 *) 0x6008000)
#define MapData ((u16 *) 0x600E800)
#define BG0Data ((u16 *) 0x6000000)
#define BG2Data ((u16 *) 0x600F000)
#define OBJData ((u16 *) 0x6010000)
#define MenuBG  ((u16 *) 0x600F800)

#define DMA3Source		(*(u32 *) 0x040000D4)
#define DMA3Dest		(*(u32 *) 0x040000D8)
#define DMA3Options		(*(u32 *) 0x040000DC)

#define objPalTile(tile) (*(u16 *) (objBaseAddr + 0x04 + (tile*0x44)))
#define objXPos(tile)    (*(u16 *) (objBaseAddr + 0x20 + (tile*0x44)))
#define objYPos(tile)    (*(u16 *) (objBaseAddr + 0x22 + (tile*0x44)))
#define objTimer(tile)	 (*(u16 *) (objBaseAddr + 0x30 + (tile*0x44)))
#define objVisible(tile) (*(u8  *) (objBaseAddr + 0x2E + (tile*0x44)))

#define moveFlag		(*(u16 *) (globalVars + 0x0))
#define steps			(*(u16 *) (globalVars + 0x2))
#define carryFlag		(*(u16 *) (globalVars + 0x4))
#define dataX			(*(u8  *) (globalVars + 0x6))
#define dataY			(*(u8  *) (globalVars + 0x7))
#define currentTile		(*(u8  *) (globalVars + 0x8))
#define currentLoop		(*(u8  *) (globalVars + 0x9))
#define tileConfig		( (u8  *) (globalVars + 0xA))	// Size of 0x1E

u16 Win();
void init2();
void init3();
void main();

void init() {

	storeCallback((void *) init2 + 1);
	
}

#include "include/gba_compress.h"

//Select the proper useful.h for the version we're compiling
#ifdef engine
#if engine == 1
	#include "useful-bpee.h"
#else
	#include "useful-bpre.h"
#endif
#endif

void init2() {

	storeCallback2(0);
	globalVars = malloc(0x2228);						//malloc 0x2228 bytes
	
	int blank = 0;
	DMA3Source = &blank;
	DMA3Dest = globalVars;
	DMA3Options = 0x81001114;						//blank out malloc space
	
	currentLoop = 0;
	
	storeCallback((void *) init3 + 1);
	
}

void init3() {
	for(int i=0x10;i<0x20;i+=2) changeIO(i,0);
	
	initStuff();
	
	const u32 mapDataUnk[2] = {
		0x000001E0, 0x000011D9
	};
	
	initMapData(0x1,mapDataUnk,0x2);
	
	storeCallback((void *) main + 1);
	
}

void main() {					// The main loop
storeCallback((void *) main + 1);
	if (currentLoop == 0) {
		currentTile = 0;
		steps = 0;
		carryFlag = moveFlag = 0;
		dataX = dataY = 1;
		currentLoop = 0;
		
		initVideo();
		initBG();
		initConfig(var8004);
		initTiles(var8004);
		setTileGFobjXPos();
		
		unfadeScreen();
		currentLoop++;
		storeCallback2((void *) updateEverything2 + 1);
	
	}
	
	else if (currentLoop == 1) {
		if (fadeScreenDone == 0)
			currentLoop++;
	}
	
	else if (currentLoop == 2) {
		if (!Win()) {
playFanfare(WINSONG);
			getKeyInput();
		}
		
		else {
			if (waitForSound() == 0) {
				playFanfare(WINSONG);
				currentLoop++;
			}
		}
	}
	
	else if (currentLoop == 3) {
		
		if (waitForFanfare() == 1) {                        // Ignore A or B until the fanfare is done
			if (keyPressed(KEY_A) || keyPressed(KEY_B)) {   // Wait until the player presses A or B
				LASTRESULT = 1;
				fadeScreen();
				currentLoop++;
			}
		}
	}
	
	else if (currentLoop == 4) {
		if (fadeScreenDone == 0) {
			storeCallback(nullCallback);
			if (globalVars != 0) {
				free(globalVars);
				globalVars = 0;
			}
			someExitFunc();
		}
	}
	
	updateEverything();

}

void initVideo() {

	changeIO(0,OBJ_ENABLE | OBJ_MAP_1D);
	
	u32 x = 0x80 << 5;
	u32 endAddr = 0xC0 << 0x13;
	int blank = 0;
	
	for(u32 i = 0xC0 << 9; i > x ; i -= x, endAddr += x) {
		DMA3Source = &blank;
		DMA3Dest = endAddr;
		DMA3Options = 0x81000800;
	}
	
	forceNewBoxAndInitBG(boxInitStuff);
	
	enableBG(0);
	enableBG(1);
	
	changeIO(0x8,(0x1E << SCREEN_SHIFT));
	changeIO(0xA,(0x1D << SCREEN_SHIFT) | (2 << CHAR_SHIFT) | 3);
	
}

const u8 tutorialText[23] = {
	0xF8, 0x0C, 0xC7, 0xC9, 0xD0, 0xBF, 0x00, 0x00, 0xF8, 0x00, 0xC1, 0xCC, 0xBB, 0xBC, 0x00, 0x00, 0xF8, 0x01, 0xBF, 0xD2, 0xC3, 0xCE, 0xFF //(+)MOVE  (A)GRAB  (B)EXIT
};

const u8 tutorialText2[23] = {
	0xF8, 0x0C, 0xC7, 0xC9, 0xD0, 0xBF, 0x00, 0x00, 0xF8, 0x00, 0xBE, 0xCC, 0xC9, 0xCA, 0x00, 0x00, 0xF8, 0x01, 0xBF, 0xD2, 0xC3, 0xCE, 0xFF //(+)MOVE  (A)DROP  (B)EXIT
};

const u8 tutorialText3[23] = {
	0xF8, 0x00, 0xF8, 0x01, 0xBF, 0xD2, 0xC3, 0xCE, 0xFF //(A)(B)EXIT
};

void initBG() {
	
	loadTutorialText(tutorialText);
	
	loadPalette(background_Palette,0x0,0x20);		//unpack BG pal data
	LZ77UnCompVram(background_Tiles, Tiles);		//unpack BG tile data
	LZ77UnCompVram(background_Map,   MapData);		//unpack BG tilemap data
	
}

void *memcpy(void *dest, const void *src, u32 n) {
	for(u32 i = 0 ; i < n ; i++)
		((char *) dest)[i] = ((const char *) src)[i];
	
	return dest;
}

void initConfig(u8 puzzleNumber) {
	u8 config0[30] = {
		0x03, 0x00, 0x00, 0x04, 0x00, 0x08,
		0x0B, 0x06, 0x00, 0x00, 0x0E, 0x00,
		0x07, 0x00, 0x09, 0x01, 0x00, 0x00,
		0x0F, 0x02, 0x0D, 0x00, 0x00, 0x00,
		0x05, 0x00, 0x00, 0x10, 0x0A, 0x0C
	};
	
	u8 config1[30] = {
		0x01, 0x0E, 0x00, 0x05, 0x10, 0x06,
		0x0B, 0x00, 0x00, 0x0D, 0x00, 0x00,
		0x00, 0x07, 0x00, 0x00, 0x02, 0x00,
		0x00, 0x00, 0x08, 0x04, 0x00, 0x0A,
		0x09, 0x0C, 0x03, 0x00, 0x00, 0x0F
	};
	
	u8 config2[30] = {
		0x04, 0x0E, 0x00, 0x0C, 0x03, 0x08,
		0x0A, 0x02, 0x06, 0x10, 0x00, 0x00,
		0x00, 0x09, 0x00, 0x00, 0x00, 0x00,
		0x05, 0x00, 0x07, 0x01, 0x0F, 0x00,
		0x00, 0x0D, 0x00, 0x0B, 0x00, 0x00
	};
	
	u8 config3[30] = {
		0x09, 0x05, 0x00, 0x00, 0x0C, 0x00,
		0x10, 0x00, 0x00, 0x00, 0x00, 0x03,
		0x00, 0x0E, 0x04, 0x02, 0x00, 0x00,
		0x0D, 0x00, 0x00, 0x07, 0x0A, 0x00,
		0x01, 0x08, 0x0B, 0x06, 0x00, 0x0F
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

const u32 OAMData1[2] = {
	0x80000000, 0x00000000
};

const u32 OAMData2[2] = {
	0x80000000, 0x00000800
};

const u32 OAMAnimTable2[2] = {
	0x00000000, 0x0000FFFF
};

const u32 OAMAnimTable1[1] = {
	OAMAnimTable2
};
	
void pointerAnimFunc(u8 *address) {

	if(!carryFlag) {
		if(*(address + 0x2E) == 0x1) {
			(*(address + 0x30))++;
			if ((*(address + 0x30) & 0x10) != 0)
				*(address + 0x3E) = *(address + 0x3E) | 4;
			else
				*(address + 0x3E) = *(address + 0x3E) & -5;
		}
		else
		*(address + 0x3E) = *(address + 0x3E) | 4;
	}
	else {
		*(address + 0x30) = 0;
		*(address + 0x3E) = *(address + 0x2E) & -5;
	}
}
	
void initTiles(u8 puzzleNumber) {

	if(puzzleNumber == 0)
		LZ77UnCompVram(tileset00_data, globalVars + 0x28);
	else if(puzzleNumber == 1)
		LZ77UnCompVram(tileset01_data, globalVars + 0x28);
	else if(puzzleNumber == 2)
		LZ77UnCompVram(tileset02_data, globalVars + 0x28);
	else
		LZ77UnCompVram(tileset03_data, globalVars + 0x28);
	
	LZ77UnCompVram(pointer_data, globalVars + 0x2028);
	
	const u32 pointerData[6] = {
		0x00000000, OAMData1, OAMAnimTable1, 0x00000000,
		dummyAnimData, pointerAnimFunc
	};

	u32 pointerArt[2] = {
		(globalVars + 0x2028), 0x00000200
	};

	u32 tilePalData[2] = {
		tiles_palette, 0x00000000
	};
	
	loadSpritePal(tilePalData);
	
	int result = createSprite(pointerArt,pointerData,0x57,0x47,0);
	
	*(((u8 *) result) + 0x2E) = 1;
	
}

const u8 coordsX[30] = {
	0x37, 0x58, 0x70, 0x88, 0xA0, 0xC1,
	0x37, 0x58, 0x70, 0x88, 0xA0, 0xC1,
	0x37, 0x58, 0x70, 0x88, 0xA0, 0xC1,
	0x37, 0x58, 0x70, 0x88, 0xA0, 0xC1,
	0x37, 0x58, 0x70, 0x88, 0xA0, 0xC1
};

const u8 coordsY[30] = {
	0x28, 0x28, 0x28, 0x28, 0x28, 0x28,
	0x48, 0x48, 0x48, 0x48, 0x48, 0x48,
	0x60, 0x60, 0x60, 0x60, 0x60, 0x60,
	0x78, 0x78, 0x78, 0x78, 0x78, 0x78,
	0x90, 0x90, 0x90, 0x90, 0x90, 0x90
};



u16 getTilePos(u8 tileNumber) {
	for(u32 i = 0 ; i < 30 ; i++)
		if((tileConfig[i] & 0x7F) == tileNumber)
			return i;
	
	return 0;
}

void setTileGFobjXPos() {

	for(u8 i = 1 ; i <= 16 ; i++) {
	
		u32 tileData[6] = {
			i, OAMData2, OAMAnimTable1, 0x00000000,
			dummyAnimData, dummyAnimRoutine
		};

		u32 tileArt[2] = {
			(globalVars + 0x28 + ((i - 1) * 0x200)), ((i << 0x10) + 0x200)
		};

		u16 position = getTilePos(i);
		createSprite(tileArt,tileData,coordsX[position],coordsY[position],i);				//PRIORITY(1) | (i - 1) * 16;

	}
}

void getKeyInput() {
	if(keyPressed(KEY_RIGHT)) {
		if (dataX < 5) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else {
				objTimer(0) = 0;
				playSound(EMPTYMOVESOUND);
			}
			
			objXPos(currentTile) -= coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXPos(0) -= coordsX[dataY*6+dataX];
			
			dataX++;
			
			objXPos(currentTile) += coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXPos(0) += coordsX[dataY*6+dataX];
		}
		
	} else if(keyPressed(KEY_LEFT)) {
		if (dataX > 0) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else {
				objTimer(0) = 0;
				playSound(EMPTYMOVESOUND);
			}
			
			objXPos(currentTile) -= coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXPos(0) -= coordsX[dataY*6+dataX];
			
			dataX--;
			
			objXPos(currentTile) += coordsX[dataY*6+dataX];
			
			if(currentTile != 0)
				objXPos(0) += coordsX[dataY*6+dataX];
		}
		
	} else if(keyPressed(KEY_DOWN)) {
		if (dataY < 4) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else {
				objTimer(0) = 0;
				playSound(EMPTYMOVESOUND);
			}
			
			objYPos(currentTile) -= coordsY[dataY*6+dataX];
			
			if(currentTile != 0)
				objYPos(0) -= coordsY[dataY*6+dataX];
			
			dataY++;
			
			if(currentTile != 0)
				objYPos(currentTile) += coordsY[dataY*6+dataX];
			
			objYPos(0) += coordsY[dataY*6+dataX];
		}
		
	} else if(keyPressed(KEY_UP)) {
		if (dataY > 0) {
			if(carryFlag)
				playSound(TILEMOVESOUND);
			else {
				objTimer(0) = 0;
				playSound(EMPTYMOVESOUND);
			}
			
			objYPos(currentTile) -= coordsY[dataY*6+dataX];
			
			if(currentTile != 0)
				objYPos(0) -= coordsY[dataY*6+dataX];
			
			dataY--;
			
			if(currentTile != 0)
				objYPos(currentTile) += coordsY[dataY*6+dataX];
			
			objYPos(0) += coordsY[dataY*6+dataX];
		}

	} else if(keyPressed(KEY_A)) {
			if (carryFlag) {
				if (tileConfig[dataY*6+dataX] == 0) {
					playSound(DROPTILESOUND);
					tileConfig[dataY*6+dataX] = currentTile;
					objPalTile(currentTile) = PRIORITY(2) | (objPalTile(currentTile) & 0x3FF);
					currentTile = 0;
					carryFlag = 0;
					if(!Win()) {
						reloadTutorialText(tutorialText);
						objPalTile(0) = PRIORITY(0);
					}
					else {
						objVisible(0) = 0;
						reloadTutorialText(tutorialText3);
					}
				} else
					playSound(ERRORSOUND);
			}
			else {
				if (tileConfig[dataY*6+dataX] != 0) {
					reloadTutorialText(tutorialText2);
					playSound(TAKETILESOUND);
					currentTile = tileConfig[dataY*6+dataX];
					tileConfig[dataY*6+dataX] = 0;
					carryFlag = 1;
					objPalTile(currentTile) = PRIORITY(0) | (objPalTile(currentTile) & 0x3FF);
					objPalTile(0) = PRIORITY(1);
				} else
					playSound(ERRORSOUND);
			}

	} else if (keyPressed(KEY_B)) {
				LASTRESULT = 0;
				fadeScreen();
				currentLoop = 4;
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
	
	return 1;
}
