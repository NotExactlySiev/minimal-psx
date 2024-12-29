NAME	:= minimal

# Replace these with the prefix for your compile tools.
TGT 	:= mipsel-unknown-none-elf
MKISO	:= mkpsxiso
CC	:= $(TGT)-gcc
OBJCOPY	:= $(TGT)-objcopy

INCDIRS	:=
LIBDIRS	:=
LIBS	:=

# Do you want the spicyjpeg headers?
INCDIRS	+= -Ispicy

# Do you want Psy-Q?
#INCDIRS	+= -Ipsyq/include
#LIBDIRS	+= -Lpsyq/lib
#LIBS		+= -lc -lapi # etc

# Required flags
CCFLAGS	:= -Wall -march=r3000 -mno-abicalls -static -msoft-float -fno-builtin
LDFLAGS := -T ps-exe.ld -Wl,--oformat=elf32-littlemips -nostartfiles

# User Flags
CCFLAGS	+= -g -O1 -flto -G0
LDFLAGS += -Wl,-Map=build/$(NAME).map

BUILD	:= build

# Build a single executable or a disc image.
#all: build/$(NAME).exe
all: $(BUILD)/$(NAME).bin
	mkdir -p $(BUILD)
.PHONY: all

build/$(NAME).elf: src/main.c src/kernel.s
	$(CC) $(INCDIRS) $(CCFLAGS) $(LIBDIRS) $(LDFLAGS) -o $@ $^ $(LIBS)

$(BUILD)/$(NAME).exe: $(BUILD)/$(NAME).elf
	$(OBJCOPY) -O binary $^ $@

# This rule can be removed if you don't need a disc image.
$(BUILD)/$(NAME).bin: disc.xml $(BUILD)/$(NAME).exe $(FILES)
	$(MKISO) -y --quiet --cuefile build/$(NAME).cue --output $@ $<

clean:
	rm -r build/*
.PHONY: clean
