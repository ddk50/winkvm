CC   		= gcc
WGET 		= wget
WPUT 		= wput
RM	 		= rm
TARGETFILE  = winkvmstab.sys
UPLOADOBJS	= $(TARGETFILE)
ID			= ddk
PASSWD		= AR3\$$WS1
WGETHOSTS	= "hosts"
SERVER 		= ftp://$(ID):$(PASSWD)@tertes.homelinux.com
MAKE		= make
DIP			= DIP.exe
CURDIR		= $(shell pwd)

.PHONY: upload install uninstall clean

up:
	wput -u -B $(UPLOADOBJS) $(SERVER)

get:
	for i in $(UPLOADOBJS); do `rm -f $$i`; done
## for i in $(UPLOADOBJS); do `wget -i $(WGETHOSTS)`; done
	wget -i $(WGETHOSTS)

install:
	$(MAKE) uninstall
	$(MAKE) clean
	$(MAKE) get
	$(DIP) -i $(TARGETFILE)

uninstall:
	$(DIP) -e $(TARGETFILE)

clean:
	rm -rf $(TARGETFILE)
	rm -rf *.pdb
	rm -rf *.ilk
