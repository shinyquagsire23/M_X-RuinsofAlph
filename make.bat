path=F:\Romhacking\Tools\devKIT\devkitARM_r24\bin\
::%path%arm-eabi-gcc -Wall -S -mthumb -mthumb-interwork -specs=gba.specs -O3 main.c
::%path%arm-eabi-gcc -S -mthumb -mthumb-interwork -O3 main.c
%path%arm-eabi-as -o main.o main.s
%path%arm-eabi-objcopy -O binary main.o main_assembler.gba

::%path%arm-eabi-gcc -Wall -mthumb -mthumb-interwork main.c -o main.elf
::%path%arm-eabi-objcopy -O binary main.elf main.gba

::%path%arm-eabi-gcc-4.3.2.exe  -o Test.elf main.c  -lm
::%path%arm-eabi-objcopy -O binary Test.elf Test.bin

::%path%arm-eabi-gcc -c -mthumb -mthumb-interwork -o myRom.elf main.c
::%path%arm-eabi-objcopy -O binary myRom.elf myRom.gba

%path%arm-eabi-gcc -Wall -mthumb -mthumb-interwork -specs=gba_alph.specs main.c -O2 -o main.elf
%path%arm-eabi-objcopy -O binary main.elf main.gba

%path%arm-eabi-gcc -Wall -mthumb -mthumb-interwork -specs=gba.specs main.c -O2 -o main.elf
%path%arm-eabi-objcopy -O binary main.elf main_standalone.gba

pause