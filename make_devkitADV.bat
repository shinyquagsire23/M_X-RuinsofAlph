path=F:\Romhacking\GBA\devkitadv-r5-beta-3\bin
::%path%arm-eabi-gcc -Wall -S -mthumb -mthumb-interwork -specs=gba_er.specs -O3 main.c
::%path%arm-eabi-gcc -S -mthumb -mthumb-interwork -O3 main.c
::%path%arm-eabi-as -o main.o main.s
::%path%arm-eabi-objcopy -O binary main.o main_assembler.gba

::%path%arm-eabi-gcc -Wall -mthumb -mthumb-interwork main.c -o main.elf
::%path%arm-eabi-objcopy -O binary main.elf main.gba

::%path%arm-eabi-gcc-4.3.2.exe  -o Test.elf main.c  -lm
::%path%arm-eabi-objcopy -O binary Test.elf Test.bin

::%path%arm-eabi-gcc -c -mthumb -mthumb-interwork -o myRom.elf main.c
::%path%arm-eabi-objcopy -O binary myRom.elf myRom.gba

%arm-agb-elf-gprof -Wall -mthumb -mthumb-interwork -specs=gba_mb.specs main.c -O2 -o main.elf
%path%arm-agb-elf-objcopy -O binary main.elf main.gba

pause