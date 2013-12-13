#define objBaseAddr		 (u8  *) 0x02020630
#define OAMBuffer ((OAMThingy*)objBaseAddr)
#define dummyAnimData	 (u32 *) 0x082EC6A8
#define dummyAnimRoutine (u32 *) 0x08007429

//Memory Locations
#define OAM_Mem                ((u16*)0x030022F8)
#define OBJ_PaletteMem        ((u16*)0x02037914) // Sprite Palette(256/16 colors) (adjusted for FR callback)
#define BG_PaletteMem          ((u16*)0x02037714) // Background Palette(256/16 colors) (adjusted for FR callback)
#define BG_PaletteMem2          ((u16*)0x02037B14) // Background Palette(256/16
#define OBJ_PaletteMem2        ((u16*)0x02037D14) // Sprite Palette(256/16 colors)

//Key Stuffs
#define KEYS         *(volatile u8*)0x030022EE
#define KEYSHOLD     *(volatile u8*)0x030022EC
#define KEYSLR       *(volatile u8*)0x030022EF
#define KEYSHOLDLR   *(volatile u8*)0x030022ED
#define keyPressed(k)    (KEYS & k)
#define keyHeldDown(k)   (KEYSHOLD & k)
#define keyPressedLR(k)  (KEYSLR & k)
#define keyHeldDownLR(k) (KEYSHOLDLR & k)

//Variables and Such
#define LASTRESULT		(*(u16 *) 0x20375F0)
#define var8004			(*(u16 *) 0x20375E0)
#define fadeScreenDone	(*(u8  *) (0x02037FD4 + 7))
#define globalVars		(*(u32 *) 0x0203BCD0)
#define boxInitStuff 0x0858BE30
#define nullCallback 0x080861CD

//RoA Sounds
#define EMPTYMOVESOUND  0x05
#define TILEMOVESOUND   0x23
#define ERRORSOUND      0x20
#define TAKETILESOUND   0x24
#define DROPTILESOUND   0x2C
#define WINSONG         0x186

void updateEverything()
{
	int (*func)(void) = (int (*)(void))0x080A910D;
	func();

	int (*func2)(void) = (int (*)(void))0x080069C1;
	func2();
	
	int (*func3)(void) = (int (*)(void))0x08006A0D;
	func3();
	
	int (*func4)(void) = (int (*)(void))0x080A1A1D;
	func4();
}

//TODO Find actual names
void updateEverything2()
{
	int (*func)(void) = (int (*)(void))0x08007189;
	func();
	
	int (*func2)(void) = (int (*)(void))0x0800742D;
	func2();
	
	int (*func3)(void) = (int (*)(void))0x080A19C1;
	func3();
}

u32 malloc(int *size)
{
	int (*func)(u32) = (int (*)(u32))0x08000B39;
	return func(size);
}

void free(int *addr)
{
	int (*func)(u32) = (int (*)(void))0x08000B61;
	func(addr);
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

	int (*func)(u32,u16,u16,u16,u16) = (int (*)(void))0x080A1AD5;
	func(bitmask,r1,r2,r3,color);
		
}

void copyPal(void *source, void *dest)
{
	asm("mov r2, #0x8");
	SystemCall(0xC);
	//int (*func)(void) = (int (*)(void))0x080087BD;
	//func();
}

void copyMem(void *source, void *dest, void *size)
{
	asm("mov r2, #0x8");
	SystemCall(0xC);
}

void playFanfare(int *fanfareNum)
{
	int (*func)(u16) = (int (*)(void))0x080A30E5;
	func(fanfareNum);
}

u8 waitForFanfare() {

	int (*func)(void) = (int (*)(u8))0x080A3121;
	return func();
	
}

void playSound(int *soundNum)
{
	int (*func)(u16) = (int (*)(void))0x080A37A5;
	func(soundNum);
}

u8 waitForSound() {

	int (*func)(void) = (int (*)(u8))0x080A38A1;
	return func();
	
}

void changeIO(int *offset, int *value)
{
	int (*func)(u32,u16) = (int (*)(void))0x080010B5;
	func(offset,value);
}

void enableBG(int *BG)
{
	int (*func)(u8) = (int (*)(void))0x08001B31;
	func(BG);
}

void clearOAM()
{
	int (*func)(void) = (int (*)(void))0x08006975;
	func();
}

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
	int (*func)(u32) = (int (*)(void))0x08000541;
	func(addr);
}	

void storeCallback2(int *addr)
{	
	int (*func)(u32) = (int (*)(void))0x080006F1;
	func(addr);
}

u32 createSprite(int *addr, int *addr2, int *XPos, int *YPos, int *i)
{
	int (*func)(u32) = (int (*)(void))0x080084F9;
	func(addr);
	
	int (*func2)(u32,u16,u16,u8) = (int (*)(u8))0x08006DF5;
	u32 result = func2(addr2,XPos,YPos,0);
	
	result = (result*0x44) + objBaseAddr;
	
	return result;
	
}

void loadPalette(int *addr, int *offset, int *length)
{
	int (*func)(u32,u8,u8) = (int (*)(void))0x080A1939;
	func(addr,offset,length);
	
}

const u8 instsData[3] = {
	0xF, 0x1, 0x2
};

void boxPrint(u8 foo, u8 font, u8 x, u8 y, u32 bar, u32 baz, u32 txtpointer)
{
	int (*func3)(u8,u8,u8,u8,u32,u32,u32) = (int (*)(void))0x08199E65;
	func3(foo,font,x,y,bar,baz,txtpointer);
}

void writeBoxesToTilemap(u8 a, u8 b)
{
	int (*func5)(u8,u8) = (int (*)(void))0x08003659;
	func5(a,b);
}

void drawTutorialBar(u8 a, u8 b)
{
	int (*func2)(u8,u8) = (int (*)(void))0x08003C49;
	func2(a,b);
}

void loadTutorialText(u32 *textAddr)
{
	int (*func)(u8) = (int (*)(u32))0x08098C19;		//load tutorial bar palette
	loadPalette(func(2),0xB0,0x20);
	drawTutorialBar(0x0,0xFF);	
	boxPrint(0x0,0x0,0x2,0x1,instsData,0x00000000,textAddr);
	
	int (*func4)(u8) = (int (*)(void))0x0800378D;
	func4(0x0);
	
	writeBoxesToTilemap(0x0,3);
}

void reloadTutorialText(u32 *textAddr, int shortText)
{
	drawTutorialBar(0x0,0xFF);
	boxPrint(0x0,0x0,0x2,0x1,instsData,0x00000000,textAddr);
}

void initMapData(u8 *r0, u32 *r1, u8 *r2)
{
	int (*func)(u8,u32,u8) = (int (*)(void))0x080017E9;
	func(r0,r1,r2);
}

void someExitFunc()
{
	int (*func)(void) = (int (*)(void))0x08003605;
	func();
}

void forceNewBoxAndInitBG(u32 *addr)
{
	int (*func)(u32) = (int (*)(void))0x080031C1;
	func(addr);
}

void loadSpritePal(u32 *addr)
{
	int (*func)(u32) = (int (*)(void))0x08008745;
	func(addr);
}
