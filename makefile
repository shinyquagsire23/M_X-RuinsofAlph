default_target: bpre
.PHONY : default_target

TARGET = $@

ifdef offset
INSERT=$(shell printf "%d" 0x$(offset))
endif

PATH      := /opt/devkitpro/devkitARM/bin:$(PATH)

LIBS:=-lm -lc -lgcc
LIBPATHS=$(foreach dir,$(wildcard $(DEVKITARM)/lib/gcc/arm-none-eabi/*),-L$(dir)) -L$(DEVKITARM)/arm-none-eabi/lib

OPTS := -O0 -fomit-frame-pointer -mno-apcs-frame -mno-tpcs-frame -mno-tpcs-leaf-frame -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjustments -fcompare-elim -fcprop-registers -fdce -fdefer-pop -fdelayed-branch -fdse -fforward-propagate -fguess-branch-probability -fif-conversion -fif-conversion2 -fipa-modref -fipa-profile -fipa-pure-const -fipa-reference -fipa-reference-addressable -fmerge-constants -fmove-loop-invariants -fmove-loop-stores -fomit-frame-pointer -freorder-blocks -fshrink-wrap -fshrink-wrap-separate -fsplit-wide-types -fssa-backprop -fssa-phiopt -ftree-bit-ccp -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre -ftree-phiprop -ftree-pta -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra -ftree-ter -funit-at-a-time -fcaller-saves -fcode-hoisting -fcrossjumping -fcse-follow-jumps -fcse-skip-blocks -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively -fexpensive-optimizations -ffinite-loops -fgcse -fgcse-lm -fhoist-adjacent-loads -fipa-bit-cp -fipa-cp -fipa-icf -fipa-ra -fipa-sra -fipa-vrp -fisolate-erroneous-paths-dereference -flra-remat -foptimize-sibling-calls -foptimize-strlen -fpeephole2 -freorder-functions -frerun-cse-after-loop -fschedule-insns -fschedule-insns2 -fsched-interblock -fsched-spec -fstore-merging -fstrict-aliasing -fthread-jumps -ftree-builtin-call-dce -ftree-loop-vectorize -ftree-pre -ftree-slp-vectorize -ftree-switch-conversion -ftree-tail-merge -ftree-vrp -fvect-cost-model=very-cheap -fno-prefetch-loop-arrays # TODO: figure out what's blocking optimization

#
#Build for Fire Red
#
bpre : 
	sed 's/^        rom     : ORIGIN = 0x08XXXXXX, LENGTH = 32M$$/        rom     : ORIGIN = 0x08$(offset), LENGTH = 32M/' linker_base.lsc > linker.lsc
	arm-none-eabi-gcc ${OPTS} -mthumb -mthumb-interwork -Dengine=0 -g -c -w -std=gnu99 -o main.out main.c
	arm-none-eabi-ld -o main.o -T linker.lsc main.out -lm -lc -lgcc $(LIBPATHS)
	arm-none-eabi-objcopy -O binary main.o main.bin

#Auto-Insert into the ROM
ifdef fname
ifdef INSERT
	dd if=main.bin of="$(fname)" conv=notrunc seek=$(INSERT) bs=1
else
	@echo "Insertion location not found!"
	@echo "Did you forget to define 'offset'?"
	@echo "Ex: make <version> fname=something.gba offset=<offset in hex>"
endif
else
	@echo "File location not found!"
	@echo "Did you forget to define 'fname'?"
	@echo "Ex: make <version> fname=<GBA ROM File> offset=1A2B3C"
endif

.PHONY : bpre

#
#Build for Emerald
#
bpee : 
	sed 's/^        rom     : ORIGIN = 0x08XXXXXX, LENGTH = 32M$$/        rom     : ORIGIN = 0x08$(offset), LENGTH = 32M/' linker_base.lsc > linker.lsc
	arm-none-eabi-gcc ${OPTS} -mthumb -mthumb-interwork -Dengine=1 -g -c -w -std=gnu99 -o main.out main.c
	arm-none-eabi-ld -o main.o -T linker.lsc main.out
	arm-none-eabi-objcopy -O binary main.o main.bin

#Auto-Insert into the ROM
ifdef fname
ifdef INSERT
	dd if=main.bin of="$(fname)" conv=notrunc seek=$(INSERT) bs=1
endif
endif

.PHONY : bpee

.PHONY : clean

clean:
	$(RM) main.o
	$(RM) main.out
	$(RM) main.bin
	$(RM) linker.lsc
