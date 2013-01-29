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

u8 tileConfiguration[30];

const u8 coordsX[30] = {
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1,
	0x27, 0x48, 0x60, 0x78, 0x90, 0xB1
};

const u8 coordsY[30] = {
	0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
	0x2C, 0x2C, 0x2C, 0x2C, 0x2C, 0x2C,
	0x44, 0x44, 0x44, 0x44, 0x44, 0x44,
	0x5C, 0x5C, 0x5C, 0x5C, 0x5C, 0x5C,
	0x74, 0x74, 0x74, 0x74, 0x74, 0x74
};

void initAll() {
	
}

void initializeBackground() {

  u16 x, y;
	u16* ScreenBB = (u16*)ScreenBaseBlock(8);
	u16* CharBB = (u16*) CharBaseBlock(0);
	
	x = 0;
	y = 1;
	
	while (x<60) {
		lzData[x]=palette_Data[x*2]+(palette_Data[x*2+1]<<8);
		x++;
	}
	LZ77UnCompVRAM((u32)lzData, (u32)BG_PaletteMem);
	
	x = 0;
	while (x<1680) {
		lzData[x]=background_Tiles[x*2]+(background_Tiles[x*2+1]<<8);
		x++;
	}
	LZ77UnCompVRAM((u32)lzData, (u32)CharBB);
	
	x = 0;
	while (x<448) {
		lzData[x]=background_Map[x*2]+(background_Map[x*2+1]<<8);
		x++;
	}
	LZ77UnCompVRAM((u32)lzData, (u32)lzData2);
	
	x = 1;
	
	while (x<651) {
			ScreenBB[x-1] = lzData2[y-1];
			if (y % 30 == 0 && x != 0) {
				x++;
				x++;
			}
			x++;
			y++;
	}
}

void initializeConfig(u8 puzzleNumber) {
	u8 x;
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
	
	if (puzzleNumber == 0) {
		for (x=0;x<30;x++) {
			tileConfiguration[x]=config0[x];
		}
	}
	if (puzzleNumber == 1) {
		for (x=0;x<30;x++) {
			tileConfiguration[x]=config1[x];
		}
	}
	if (puzzleNumber == 2) {
		for (x=0;x<30;x++) {
			tileConfiguration[x]=config2[x];
		}
	}
	if (puzzleNumber == 3) {
		for (x=0;x<30;x++) {
			tileConfiguration[x]=config3[x];
		}
	}

}

u16 getTilePos(u8 tileNumber) {
	u16 y, result;
	result = 0;
	
	for(y=0;y<30;y++) {
		if ((tileConfiguration[y] & 0x7F) == tileNumber) {
			result = y;
		} 
	}
	return result;
}

u16 getPosX(u16 position) {
	u16 pos;
	pos = position;
	while (pos>5) {
		pos = pos - 6;
	}
	return pos;
}

u16 getPosY(u16 position) {
	u16 pos;
	pos = position;
	if (pos<6) {
		return 0;
	}
	else {
		return 1 + getPosY(pos - 6);
	}
}

void initializeTiles(u8 puzzleNumber) {
	u16 x;
	
	sprites[0].attribute0 = COLOR_16 | SQUARE | 43;  //set 256 colors, shape and y-coordinate
	sprites[0].attribute1 = SIZE_32 | 71;  //set shape and x-coordinate
	sprites[0].attribute2 = PRIORITY(0) | 256;   //points to where in VRAM we get the tile data from
	
	x = 0;
	while (x<16) {
		OBJ_PaletteMem[x] = tiles_palette[x*2]+(tiles_palette[x*2+1]<<8);
		x++;
	}
	
	x = 0;
	if (puzzleNumber == 0) {
		while (x<1294) {
			lzData[x]=tileset00_data[x*2]+(tileset00_data[x*2+1]<<8);
			lzData2[x]=pointer_data[x*2]+(pointer_data[x*2+1]<<8);
			x++;
		}
	}
	if (puzzleNumber == 1) {
		while (x<1170) {
			lzData[x]=tileset01_data[x*2]+(tileset01_data[x*2+1]<<8);
			lzData2[x]=pointer_data[x*2]+(pointer_data[x*2+1]<<8);
			x++;
		}
	}
	if (puzzleNumber == 2) {
		while (x<1074) {
			lzData[x]=tileset02_data[x*2]+(tileset02_data[x*2+1]<<8);
			lzData2[x]=pointer_data[x*2]+(pointer_data[x*2+1]<<8);
			x++;
		}
	}
	if (puzzleNumber == 3) {
		while (x<1034) {
			lzData[x]=tileset03_data[x*2]+(tileset03_data[x*2+1]<<8);
			lzData2[x]=pointer_data[x*2]+(pointer_data[x*2+1]<<8);
			x++;
		}
	}

	LZ77UnCompVRAM((u32)lzData, (u32)OAM_Data);
	LZ77UnCompVRAM((u32)lzData2, (u32)OAM_Data+0x2000);
	
}

void setTileGFX() {
	
	u16 position, x;
	
	for(x=1;x<=16;x++) {
		position = getTilePos(x);
		sprites[x].attribute0 = COLOR_16 | SQUARE | coordsY[getPosY(position)*6+getPosX(position)];
		sprites[x].attribute1 = SIZE_32 | coordsX[getPosY(position)*6+getPosX(position)];
		sprites[x].attribute2 = PRIORITY(1) | (x - 1) * 16;
		
	}
}

void getKeyInput() {
		if (!MOVEFLAG) {
			if keyDown(KEY_RIGHT) {
				if (DATAX < 5) {
					MOVEFLAG = 1;
					DATAX++;
					if (CURRENTTILE != 0) {
						DESTX = coordsX[DATAY*6+DATAX];
					}
					CURX = coordsX[DATAY*6+DATAX]-1;
				}
			}
			if keyDown(KEY_LEFT) {
				if (DATAX > 0) {
					MOVEFLAG = 1;
					DATAX--;
					if (CURRENTTILE != 0) {
						DESTX = coordsX[DATAY*6+DATAX];
					}
					CURX = coordsX[DATAY*6+DATAX]-1;
				}
			}
			if keyDown(KEY_DOWN) {
				if (DATAY < 4) {
					MOVEFLAG = 1;
					DATAY++;
					if (CURRENTTILE != 0) {
						DESTY = coordsY[DATAY*6+DATAX];
					}
					CURY = coordsY[DATAY*6+DATAX]-1;
				}
			}
			if keyDown(KEY_UP) {
				if (DATAY > 0) {
					MOVEFLAG = 1;
					DATAY--;
					if (CURRENTTILE != 0) {
						DESTY = coordsY[DATAY*6+DATAX];
					}
					CURY = coordsY[DATAY*6+DATAX]-1;
				}
			}
			if keyDown(KEY_A) {
				if (!MOVEFLAG & !ABUTTON) {
					if (CARRYFLAG) {
						if (tileConfiguration[DATAY*6+DATAX] == 0) {
							tileConfiguration[DATAY*6+DATAX] = CURRENTTILE;
							sprites[CURRENTTILE].attribute2 = PRIORITY(1) | (sprites[CURRENTTILE].attribute2 & 0x3FF);
							CURRENTTILE = 0;
							CARRYFLAG = 0;
							sprites[0].attribute2 = PRIORITY(0) | 256;
							ABUTTON = 1;
							OBJ_PaletteMem[8] = 0x109F;
						}
					}
					else {
						if (tileConfiguration[DATAY*6+DATAX] != 0) {
							CURRENTTILE = tileConfiguration[DATAY*6+DATAX];
							tileConfiguration[DATAY*6+DATAX] = 0;
							CARRYFLAG = 1;
							sprites[0].attribute2 = PRIORITY(2) | 256;
							sprites[CURRENTTILE].attribute2 = PRIORITY(0) | (sprites[CURRENTTILE].attribute2 & 0x3FF);
							ABUTTON = 1;
							OBJ_PaletteMem[8] = 0x810B;
							DESTX = coordsX[DATAY*6+DATAX];
							DESTY = coordsY[DATAY*6+DATAX];
						}
					}
				}
			}
			if (!keyDown(KEY_A)) {
				ABUTTON = 0;
			}
			if (keyDown(KEY_B)) {
				BBUTTON = 1;
			}
		}
}
u16 getPxTileX() {
	return (sprites[CURRENTTILE].attribute1 & 0xFF);
}

u16 getPxTileY() {
	return (sprites[CURRENTTILE].attribute0 & 0x7F);
}

u16 getCurTileX() {
	return (sprites[0].attribute1 & 0xFF);
}

u16 getCurTileY() {
	return (sprites[0].attribute0 & 0x7F);
}

void step() {
	u16 picX, picY, cX, cY;
	
	picX = getPxTileX();
	picY = getPxTileY();
	cX = getCurTileX();
	cY = getCurTileY();
	
	if (picX < DESTX) {
		if (CURRENTTILE != 0) {
			sprites[CURRENTTILE].attribute1++;
		}
	}
	if (cX < CURX) {
		sprites[0].attribute1++;
	}
	if (picX > DESTX) {
		if (CURRENTTILE != 0) {
			sprites[CURRENTTILE].attribute1--;
		}
	}
	if (cX > CURX) {
		sprites[0].attribute1--;
	}
	if (picY < DESTY) {
		if (CURRENTTILE != 0) {
			sprites[CURRENTTILE].attribute0++;
		}
	}
	if (cY < CURY) {
		sprites[0].attribute0++;
	}
	if (picY > DESTY) {
		if (CURRENTTILE != 0) {
			sprites[CURRENTTILE].attribute0--;
		}
	}
	if (cY > CURY) {
		sprites[0].attribute0--;
	}
	if ((picX == DESTX) & (picY == DESTY)) {
		MOVEFLAG = 0;
	}
	if ((cX == CURX) & (cY == CURY)) {
		MOVEFLAG = 0;
	}
	
}

u16 Win() {
	
	u8 x, result;
	
	result = 1;
	const u8 win[30] = {
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x01, 0x02, 0x03, 0x04, 0x00,
		0x00, 0x05, 0x06, 0x07, 0x08, 0x00,
		0x00, 0x09, 0x0A, 0x0B, 0x0C, 0x00,
		0x00, 0x0D, 0x0E, 0x0F, 0x10, 0x00
	};
	
	for (x=0;x<30; x++) {
		if (tileConfiguration[x] != win[x]) {
			result = 0;
		}
	}
	return result;
}
