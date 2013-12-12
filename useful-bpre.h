//TODO Still pretty clueless here
void updateEverything()
{

	int (*func)(void) = (int (*)(void))0x080A910D;
	func();

	int (*func2)(void) = (int (*)(void))0x08006B5D; //call_back_oam
	func2();
	
	int (*func3)(void) = (int (*)(void))0x08006A0D;
	func3();
	
	int (*func4)(void) = (int (*)(void))0x080A1A1D;
	func4();
}

//TODO Still pretty clueless here
void updateEverything2()
{
	int (*func)(void) = (int (*)(void))0x08007189;
	func();
	
	int (*func2)(void) = (int (*)(void))0x0800742D;
	func2();
	
	int (*func3)(void) = (int (*)(void))0x080A19C1;
	func3();
}

void unfadeScreen()
{
	fadeScreen2(0xFFFFFFFF,0x0,0x10,0,0x0000);
}

void fadeScreen()
{
	fadeScreen2(0xFFFFFFFF,0x0,0,0x10,0x0000);
}

void fadeScreen2(int *bitmask, int *r1, int *r2, int *r3, int *color)
{

	int (*func)(u32,u16,u16,u16,u16) = (int (*)(void))0x08070589;
	func(bitmask,r1,r2,r3,color);
		
}

void copyPal(void *source, void *dest)
{
	asm("mov r2, #0x8");
	SystemCall(0xC);
}

void copyMem(void *source, void *dest, void *size)
{
	asm("mov r2, #0x8");
	SystemCall(0xC);
}

void playFanfare(int *fanfareNum)
{
	int (*func)(void) = (int (*)(void))0x08071C61;
	func();
}

void playSound(int *fxNum)
{
	int (*func)(void) = (int (*)(void))0x080722CD;
	func();
}

void changeIO(int *offset, int *value)
{
	int (*func)(void) = (int (*)(void))0x08000A39;
	func();
}

void enableBG(int *BG)
{
	int (*func)(void) = (int (*)(void))0x080019BD;
	func();
}

void clearOAM()
{
	int (*func)(void) = (int (*)(void))0x08006975;
	func();
}

//TODO figure out what the heck this is
void initStuff()
{
	clearOAM();
	
	int (*func2)(void) = (int (*)(void))0x0800870D;
	func2();
	
	int (*func3)(u8) = (int (*)(void))0x080017BD;
	func3(0x0);
	
}

void storeCallback(int *addr)
{
	int (*func)(void) = (int (*)(void))0x08000541; //TODO
	func();
}	

void storeCallback2(int *addr)
{	
	int (*func)(void) = (int (*)(void))0x080006F1; //TODO
	func();
}

u32 createSprite(int *addr, int *addr2, int *XPos, int *YPos, int *i)
{
	int (*func)(u32) = (int (*)(void))0x080086DD; //load_gfx
	func(addr); 
	
	int (*func2)(u32,u16,u16,u8) = (int (*)(u8))0x08006F8D;
	u32 result = func2(addr2,XPos,YPos,0);
	
	result = (result*0x44) + 0x0202063D; //oam_pre_buffer
	
	return result;
	
}

void loadPalette(int *addr, int *offset, int *length)
{
	int (*func)(u32,u8,u8) = (int (*)(void))0x080703ED;
	func(addr,offset,length);
	
}

const u8 instsData[3] = {
	0xF, 0x1, 0x2
};

//BIG TODO
void loadTutorialText(u32 *textAddr) {

	int (*func)(u8) = (int (*)(u32))0x08098C19;		//load tutorial bar palette
	loadPalette(func(2),0xB0,0x20);

	int (*func2)(u8,u8) = (int (*)(void))0x08003C49;
	func2(0x0,0xFF);
	
	int (*func3)(u8,u8,u8,u8,u32,u32,u32) = (int (*)(void))0x08199E65;
	func3(0x0,0x0,0x2,0x1,instsData,0x00000000,textAddr);
	
	int (*func4)(u8) = (int (*)(void))0x0800378D;
	func4(0x0);
	
	int (*func5)(u8,u8) = (int (*)(void))0x08003659;
	func5(0x0,3);
	
}

void reloadTutorialText(u32 *textAddr) {

	int (*func2)(u8,u8) = (int (*)(void))0x08003C49;
	func2(0x0,0xFF);

	int (*func3)(u8,u8,u8,u8,u32,u32,u32) = (int (*)(void))0x08199E65;
	func3(0x0,0x0,0x2,0x1,instsData,0x00000000,textAddr);
	
}
