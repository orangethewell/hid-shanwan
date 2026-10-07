obj-m	:= hid-shanwan.o
PWD	:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

TOOLCHAIN := 
ARCH := x86
KERNELRELEASE ?= $(shell uname -r)
KDIR := /lib/modules/$(KERNELRELEASE)/build
TCPATH :=

PATH := $(TCPATH):$(PATH)

all:
	ARCH=$(ARCH) CROSS_COMPILE=$(TOOLCHAIN) $(MAKE) -C $(KDIR) M=$(PWD) modules
clean:
	ARCH=$(ARCH) CROSS_COMPILE=$(TOOLCHAIN) $(MAKE) -C $(KDIR) M=$(PWD) clean
