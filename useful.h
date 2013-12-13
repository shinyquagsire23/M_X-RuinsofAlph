//
//Use only cross-engine compatible structs and functions in here!
//Engine specific things go in useful-[GAMECODE].h!!
//

typedef struct
{
	u16 x, y;
} Position;

typedef struct
{
	u8 y, flags, x, msbXFlags;
	u16 tileProPal, irrelevant;
} OAM;

typedef struct
{
	OAM oam;
	u32 animation;
	u8 fC, fD, fE, fF;
	u32 f10, objectTemplate, f18, callback;
	Position pos1, pos2;
	u8 pos3x, pos3y, animNr, animFrame, time, f2D;
	Position iPos, iVel;
	u32 derp1, derp2;
	u8 f42, f43, end;
} OAMThingy;

typedef struct
{
	u16 f0, f1;
	u32 oam, animation, gfx, animation2, callback;
	u8 end;
} OBJTemplate;
