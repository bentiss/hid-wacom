wacom-objs	:= wacom_wac.o wacom_sys.o
obj-m		+= wacom.o

KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install: wacom.ko
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install

uninstall:
	/bin/bash restore.sh

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

