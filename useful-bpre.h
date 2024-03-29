#define objBaseAddr		 (u8  *) 0x0202063C
#define OAMBuffer		 ((OAMThingy*)objBaseAddr)
#define dummyAnimData	 (u32 *) 0x08231CFC
#define dummyAnimRoutine (u32 *) 0x0800760D

//Memory Locations
#define OAM_Mem 	          ((u16*)0x03003128)
#define OBJ_PaletteMem        ((u16*)0x020373F8) // Sprite Palette(256/16 colors) (adjusted for FR callback)
#define BG_PaletteMem         ((u16*)0x020371F8) // Background Palette(256/16 colors) (adjusted for FR callback)
#define BG_PaletteMem2        ((u16*)0x020375F8) // Background Palette(256/16
#define OBJ_PaletteMem2       ((u16*)0x020377F8) // Sprite Palette(256/16 colors)

//Key Stuffs
#define KEYS            *(volatile u8*)0x0300311E
#define KEYSHOLD        *(volatile u8*)0x0300311C
#define KEYSSCROLL      *(volatile u8*)0x03003120
#define KEYSLR          *(volatile u8*)0x0300311F
#define KEYSHOLDLR      *(volatile u8*)0x0300311D
#define KEYSSCROLLLR    *(volatile u8*)0x03003121

//Variables and Such
#define LASTRESULT		(*(u16 *) 0x020370D0)
#define var8004			(*(u16 *) 0x020370C0)
#define fadeScreenDone	(*(u8  *) (0x02037AB8 + 7))
#define globalVars		(*(u32 *) 0x0203BCD0)
#define boxInitStuff	0x083E22C0
#define nullCallback	0x080568E1

//RoA Sounds 
#define EMPTYMOVESOUND  0x05 
#define TILEMOVESOUND   0x1D 
#define ERRORSOUND      0x1A 
#define TAKETILESOUND   0x1E 
#define DROPTILESOUND   0x26 
#define WINSONG         0x10D 

void updateEverything()
{
	int (*callback3)(void) = (int (*)(void))0x08077579;
	callback3();

	int (*callbackOAM)(void) = (int (*)(void))0x08006B5D; //call_back_oam
	callbackOAM();
	
	int (*writeOAM)(void) = (int (*)(void))0x08006BA9; //write oam
	writeOAM();
	
	int (*func4)(void) = (int (*)(void))0x080704D1; //idk
	func4();
}

void updateEverything2()
{
	int (*func)(void) = (int (*)(void))0x08007321;
	func();
	
	int (*func2)(void) = (int (*)(void))0x08007611;
	func2();
	
	int (*func3)(void) = (int (*)(void))0x08070475;
	func3();
}

u32 malloc(int *size)
{
	int (*func)(u32) = (int (*)(u32))0x08002B9D;
	return func(size);
}

void free(int *addr)
{
	int (*func)(u32) = (int (*)(void))0x08002BC5;
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

	int (*func)(u32,u16,u16,u16,u16) = (int (*)(void))0x08070589;
	func(bitmask,r1,r2,r3,color);
		
}

void playFanfare(int fanfareNum)
{
	int (*func)(u16) = (int (*)(void))0x08071C61;
	func(fanfareNum);
}

u8 waitForFanfare() {

	int (*func)(void) = (int (*)(u8))0x08071C9D;
	return func();
	
}

void playSound(int fxNum)
{
	int (*func)(u16) = (int (*)(void))0x080722CD;
	func(fxNum);
}

//TODO Actally call function
u8 waitForSound() {

	return 0;
	//int (*func)(void) = (int (*)(u8))0x080A38A1;
	//return func();
	
}

void changeIO(int *offset, int *value)
{
	int (*func)(void) = (int (*)(void))0x08000A39;
	func();
}

void enableBG(int *BG)
{
	int (*func)(u8) = (int (*)(void))0x080019BD;
	func(BG);
}

void clearOAM()
{
	int (*func)(void) = (int (*)(void))0x08006B11;
	func();
}

//TODO figure out what the heck this is
void initStuff()
{
	clearOAM();
	
	int (*func2)(void) = (int (*)(void))0x080088F1; //Still no idea
	func2();
	
	int (*func3)(u8) = (int (*)(void))0x08001619; //Still no idea about this one either
	func3(0x0);
	
}

//Unsure about this guy...
void storeCallback(int *addr)
{	
	int (*func)(u32) = (int (*)(void))0x08000545;
	func(addr);
}

void storeCallback2(int *addr)
{
	int (*func)(u32) = (int (*)(void))0x080006F5;
	func(addr);
}	

u32 createSprite(int *addr, int *addr2, int *XPos, int *YPos, int *i)
{
	int (*func)(u32) = (int (*)(void))0x080086DD; //load_gfx
	func(addr); 
	
	int (*func2)(u32,u16,u16,u8) = (int (*)(u8))0x08006F8D;
	u32 result = func2(addr2,XPos,YPos,0);
	
	result = (result*0x44) + objBaseAddr; //oam_pre_buffer
	
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

void boxPrint(u8 windowId, u8 font, u8 x, u8 y, u32 bar, u32 baz, u32 txtpointer)
{
	int (*func3)(u8,u8,u8,u8,u32,u32,u32) = (int (*)(void))0x0812E51D;
	func3(windowId,font,x,y,bar,baz,txtpointer);
}

void writeBoxesToTilemap(u8 windowId, u8 mode)
{
	int (*func5)(u8,u8) = (int (*)(void))0x08003F21;
	func5(windowId,mode);
}

void drawTutorialBar(u8 windowId, u8 value)
{
	int (*func2)(u8,u8) = (int (*)(void))0x0800445D;
	func2(windowId,value);
}

struct WindowTemplate
{
	u8 bg;
	u8 tilemapLeft;
	u8 tilemapTop;
	u8 width;
	u8 height;
	u8 paletteNum;
	u16 baseBlock;
};

u32 loadTutorialText(u32 *textAddr)
{
	const struct WindowTemplate templ = {0,0,0,30,2,11,0x226};
	u16 (*AddWindow)(const struct WindowTemplate *) = (void *)0x8003ce5;
	u8 windowId = AddWindow(&templ);
	int (*func)(u8) = (int (*)(u32))0x08150409;		//load tutorial bar palette
	loadPalette(func(2),0xB0,0x20);
	drawTutorialBar(windowId,0xFF);
	boxPrint(windowId,0x0,134,0x1,instsData,0x00000000,textAddr);
	
	int (*func4)(u8) = (int (*)(void))0x08003FA1;
	func4(windowId); //Something with BGs
	
	writeBoxesToTilemap(windowId,3);
	return windowId;
}

void reloadTutorialText(u32 windowId, u32 *textAddr, int shortText)
{
	drawTutorialBar(windowId,0xFF);
	boxPrint(windowId,0x0,134 + (shortText == 1 ? 68 : 0),0x1,instsData,0x00000000,textAddr);
}

void initMapData(u8 *r0, u32 *r1, u8 *r2)
{
	int (*func)(u8,u32,u8) = (int (*)(void))0x08001659;
	func(r0,r1,r2);
}

void someExitFunc()
{
	int (*func)(void) = (int (*)(void))0x08003ECD;
	func();
}

void forceNewBoxAndInitBG(u32 *addr)
{
	int (*func)(u32) = (int (*)(void))0x08003B25;
	func(addr);
}

void loadSpritePal(u32 *addr)
{
	int (*func)(u32) = (int (*)(void))0x08008929;
	func(addr);
}
