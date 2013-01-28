OAMEntry sprites[128];

void initializeSprites() {
	u16 loop;
		
	for(loop = 0; loop < 128; loop++)
	{
		sprites[loop].attribute0 = 160;  //y to > 159
		sprites[loop].attribute1 = 240;  //x to > 239
		sprites[loop].attribute2 = 0;
	}
}

void CopyOAM() {
	u16 loop;
	u16* temp;
	temp = (u16*)sprites;
	
	for(loop = 0; loop < 128*4; loop++) { //2 bytes at the time (2byte * 4 * 128 = 1024 bytes)
		OAM_Mem[loop] = temp[loop];
	}
}