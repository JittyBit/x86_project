ASM=nasm
AFLAGS= -f bin 

SRC_DIR=src
BUILD_DIR=build

.PHONY: run clean 

$(BUILD_DIR)/main.img: $(BUILD_DIR)/main.bin
	cp $^ $@
	truncate -s 1440k $@

$(BUILD_DIR)/main.bin: $(SRC_DIR)/boot.asm
	$(ASM) $(AFLAGS) -o $@ $^

run:
	qemu-system-i386 -drive file=$(BUILD_DIR)/main.img,format=raw

clean:
	rm build/*
