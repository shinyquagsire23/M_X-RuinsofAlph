#include "include/gba.h"
#include "background.h"
#include "tiles.h"

#define Tiles   ((u16 *) 0x6000000)
#define MapData ((u16 *) 0x6004000)
#define BG1Data ((u16 *) 0x6008000)
#define BG2Data ((u16 *) 0x600F000)
#define OBJData ((u16 *) 0x6010000)
#define MenuBG  ((u16 *) 0x600F800)

#define objPalTile(tile) (*(u16 *) (0x02020634 + (tile*0x44)))
#define objXPos(tile)    (*(u16 *) (0x02020650 + (tile*0x44)))
#define objYPos(tile)    (*(u16 *) (0x02020652 + (tile*0x44)))
#define objVisible(tile) (*(u8  *) (0x0202066E + (tile*0x44)))

#define LASTRESULT		(*(u16 *) 0x20375F0)
#define var8004			(*(u16 *) 0x20375E0)
#define fadeScreenDone	(*(u8 *) 0x02037FDB)

#define TMPSTRPTRADDR	( (u32 *) 0x0203BCD0)
#define globalVars		(*(u32 *) TMPSTRPTRADDR)
#define moveFlag		(*(u16 *) (globalVars + 0x0))
#define steps			(*(u16 *) (globalVars + 0x2))
#define carryFlag		(*(u16 *) (globalVars + 0x4))
#define dataX			(*(u8  *) (globalVars + 0x6))
#define dataY			(*(u8  *) (globalVars + 0x7))
#define currentTile		(*(u8  *) (globalVars + 0x8))
#define currentLoop		(*(u8  *) (globalVars + 0x9))
#define tileConfig		( (u8  *) (globalVars + 0xA))	// Size of 0x1E

#define MAXPEOPLE 3

#define EMPTYMOVESOUND  0x05
#define TILEMOVESOUND   0x23
#define ERRORSOUND      0x20
#define TAKETILESOUND   0x24
#define DROPTILESOUND   0x2C
#define WINSONG         0x186

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
	globalVars = func(0x2228);
	currentLoop = 0;
	
	storeCallback((void *) init3 + 1);
	
}

void init3() {
	for(int i=0x10;i<0x20;i+=2) changeIO(i,0);
	
	clearOAM();
	
	int (*func)(u8,u32,u8) = (int (*)(void))0x080017E9;
	func(0x1,0x085E5068,0x2);
	
	storeCallback((void *) main + 1);
	storeCallback2((void *) updateEverything2 + 1);
	
}

void main() {	// The main loop

	if (currentLoop == 0) {
		currentTile = 0;
		steps = 0;
		carryFlag = moveFlag = 0;
		dataX = dataY = 1;
		currentLoop = 0;

		initBG();
		initConfig(var8004);

		initTiles(var8004);
		setTileGFobjXPos();
		initVideo();
		unfadeScreen();
		currentLoop++;
	
	}
	
	else if (currentLoop == 1) {
		if (fadeScreenDone == 0)
			currentLoop++;
	}
	
	else if (currentLoop == 2) {
		if (!Win()) {
/*			if(!carryFlag) {
				if(counter < 5000) {
					counter++;
					objVisible(0) = 0x158;
				} else if(counter < 10000) {
					counter++;
					objVisible(0) = 0x558;
				} else
					counter = 0;
			} else
				counter = 0;
			*/
			
			if (keyPressed(KEY_B)) {
				LASTRESULT = 0;
				fadeScreen();
				currentLoop = 4;
			}
			
			getKeyInput();
		}
		
		else {
			objVisible(0) = 0x5;
			
			playFanfare(WINSONG);
			currentLoop++;
		}
	}
	
	else if (currentLoop == 3) {
	
		int (*func)(void) = (int (*)(u8))0x080A3121;
		
		if (func() == 1) {                                  // Ignore A or B until the fanfare is done
			if (keyPressed(KEY_A) || keyPressed(KEY_B)) {   // Wait until the player presses A or B
				LASTRESULT = 1;
				fadeScreen();
				currentLoop++;
			}
		}
	}
	
	else if (currentLoop == 4) {
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

const u32 OAMData1[2] = {
	0x80000000, 0x00000000
};

const u32 OAMData2[2] = {
	0x80000000, 0x00000400
};

const u32 OAMAnimTable2[2] = {
	0x00000000, 0x0000FFFF
};

const u32 OAMAnimTable1[1] = {
	OAMAnimTable2
};
	
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
		0x082EC6A8, 0x08007429
	};

	u32 pointerArt[2] = {
		(globalVars + 0x2028), 0x00000200
	};

	u32 tilePalData[2] = {
		tiles_palette, 0x00000000
	};
	
	int (*func)(u32) = (int (*)(void))0x08008745;
	func(tilePalData);
	
	createSprite(pointerArt,pointerData,0x57,0x47,0);
	
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
			0x082EC6A8, 0x08007429
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
			else
				playSound(EMPTYMOVESOUND);
			
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
			else
				playSound(EMPTYMOVESOUND);
			
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
			else
				playSound(EMPTYMOVESOUND);
			
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
			else
				playSound(EMPTYMOVESOUND);
			
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
					objPalTile(currentTile) = PRIORITY(1) | (objPalTile(currentTile) & 0x3FF);
					currentTile = 0;
					carryFlag = 0;
					objPalTile(0) = PRIORITY(0);
				} else
					playSound(ERRORSOUND);
			}
			else {
				if (tileConfig[dataY*6+dataX] != 0) {
					playSound(TAKETILESOUND);
					currentTile = tileConfig[dataY*6+dataX];
					tileConfig[dataY*6+dataX] = 0;
					carryFlag = 1;
					objPalTile(currentTile) = PRIORITY(0) | (objPalTile(currentTile) & 0x3FF);
					objPalTile(0) = PRIORITY(3);
				} else
					playSound(ERRORSOUND);
			}
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