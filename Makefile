#
# blevl/Makefile
#

SHELL = /bin/sh
TARGET = blevl.elf
CPU = stm32wb55rg

LD_DIR = ld
SRC_DIR = src
INC_DIR = inc
OBJ_DIR = obj
BIN_DIR = bin

CC = arm-none-eabi-as
CC_FLAGS = -g

LD = arm-none-eabi-ld
LD_SCRIPT = $(LD_DIR)/$(CPU).ld
LD_FLAGS = -T $(LD_SCRIPT)

SRC_FILES := $(wildcard $(SRC_DIR)/*.s)
INC_FILES := $(wildcard $(INC_DIR)/*.s)
OBJ_FILES := $(SRC_FILES:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)
OUT_DIRS := $(OBJ_DIR) $(BIN_DIR)


all: $(OUT_DIRS) $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(OBJ_FILES)
	@$(LD) $(LD_FLAGS) $(OBJ_FILES) -o $@
	@echo "Linking \"$@\" complete."

$(OBJ_FILES): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.s
	@$(CC) $(CC_FLAGS) -c $< $(INC_FILES) -o $@
	@echo "Compiled \"$<\" -> \"$@\" successfully."

$(OUT_DIRS):
	@[ -d $@ ] || mkdir -p $@ \
	&& echo "Output directory \"$@\" initialized."

deploy: $(BIN_DIR)/$(TARGET)
	@openocd -f interface/stlink.cfg -f target/stm32wbx.cfg \
	-c "program $(BIN_DIR)/$(TARGET) verify reset exit"

debug: $(BIN_DIR)/$(TARGET)
	@alacritty -e arm-none-eabi-gdb $(BIN_DIR)/$(TARGET) &
	@openocd -f interface/stlink.cfg -f target/stm32wbx.cfg

clean: $(OUT_DIRS)
	@rm -f $(OBJ_DIR)/* $(BIN_DIR)/*
	@echo "Output directories clean."

