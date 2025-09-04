TARGET = popcorn

OBJS = main.o \
	src/icon.o \
	src/syspatch.o \
	src/libcrypt.o \

PSPSDK = $(shell psp-config --pspsdk-path)
ARKSDK ?= external

all: $(TARGET).prx
INCDIR = $(ARKSDK)/include
CFLAGS = -std=c99 -Os -G0 -Wall -fno-pic

ifdef DEBUG
CFLAGS += -DDEBUG=$(DEBUG)
endif

PSP_FW_VERSION = 660

CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

USE_KERNEL_LIBC=1
USE_KERNEL_LIBS=1

LIBDIR = $(ARKSDK)/libs
LDFLAGS = -nostartfiles
LIBS = -lpspsystemctrl_kernel

include $(PSPSDK)/lib/build.mak
