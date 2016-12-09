CC ?=
PREFIX ?=
PKG_DIR ?= 
CC = $(CROSS_COMPILE)gcc
AR = $(CROSS_COMPILE)ar
LD = $(CROSS_COMPILE)ld
PREFIX = $(BUILD_PREFIX)

export_env_val= export CC=$(CROSS_COMPILE)gcc PREFIX=$(BUILD_PREFIX) AR=$(CROSS_COMPILE)ar LD=$(CROSS_COMPILE)gcc

all: check libs bins
#all: check  zeromq  czmq
all_clean: zlib_clean 

libs:check zlib readline libxml2 openssl
bins:check ipmitool 


check:
	@echo "CC = $(CC) "
	@echo "PREFIX = $(PREFIX)"
	@echo "checking..."

ipmitool-1.8.17:
	tar -xf ipmitool-1.8.17.tar.bz2 -C tmp
ipmitool:ipmitool-1.8.17
	cd tmp/$< && \
	$(export_env_val) && \
	./configure --prefix=$(PREFIX) --enable-shared=yes --enable-intf-lanplus=yes &&\
	make clean; make && make install


iputils-s20151218:
	tar -xf iputils-s20151218.tar.bz2 -C tmp
iputils:iputils-s20151218
	cd tmp/$< && \
	$(export_env_val) && \
	./configure --prefix=$(PREFIX) &&\
	make clean; make && make install


ethtool-4.8:
	tar -xf ethtool-4.8.tar.gz -C tmp
ethtool:ethtool-4.8
	cd tmp/$< && \
	$(export_env_val) && \
	./configure --prefix=$(PREFIX) $(BUILD_HOST) &&\
	make clean; make && make install

zlib-1.2.8:
	tar xf zlib-1.2.8.tar.gz -C tmp
zlib: zlib-1.2.8
	cd tmp/$< && \
	$(export_env_val) && \
	./configure --shared --prefix=$(PREFIX) &&\
	make clean; make && make install
zlib_clean:
	cd zlib-1.2.8 && make clean


libcap-2.25:
	tar xf libcap-2.25.tar.gz -C tmp
libcap: libcap-2.25
	cd tmp/$< && \
	$(export_env_val) && \
	./configure --shared --prefix=$(PREFIX) &&\
	make clean; make && make install

libxml2-2.9.4:
	tar xf libxml2-2.9.4.tar.gz -C tmp
libxml2:libxml2-2.9.4
	cd tmp/$< && \
	./configure --prefix=$(BUILD_PREFIX) $(BUILD_HOST) --enable-static=no --without-python &&\
	make clean; make && make install

readline-6.3:
	tar xf readline-6.3.tar.gz -C tmp
readline:readline-6.3
	cd tmp/$< && \
	./configure --prefix=$(BUILD_PREFIX) $(BUILD_HOST) --enable-static=no bash_cv_wcwidth_broken=yes &&\
	make clean; make && make install

openssh-7.3p1:
	tar xf openssh-7.3p1.tar.gz -C tmp
openssh:openssh-7.3p1
	$(export_env_val) && \
	cd tmp/$< && \
	./configure --prefix=$(PREFIX) $(BUILD_HOST) --enable-static=no  --with-libs --enable-pkcs11 --with-ssh1 --with-md5-passwords --disable-etc-default-login --without-openssl-header-check --disable-strip &&\
	make && make install

openssl-1.0.2j:
	tar xf openssl-1.0.2j.tar.gz -C tmp
openssl:openssl-1.0.2j
	export CC=gcc PREFIX=$(BUILD_PREFIX) AR=ar LD=ld && \
	cd tmp/$< && \
	./config --prefix=$(PREFIX)  shared && \
	make clean; make && make install

zeromq-4.1.5:
	tar xf zeromq-4.1.5.tar.gz -C tmp
zeromq:zeromq-4.1.5
	export CC="" CPP="" && \
	cd tmp/$< && \
	./configure --prefix=$(PREFIX) $(BUILD_HOST)  && \
	make clean; make && make install

czmq-3.0.2:
	tar xf czmq-3.0.2.tar.gz -C tmp
czmq:czmq-3.0.2
	export CC="" CPP="" && \
	cd tmp/$< && \
	./configure --prefix=$(PREFIX) $(BUILD_HOST)  && \
	make clean; make && make install

nanomsg-1.0.0:
	tar xf nanomsg-1.0.0.tar.gz -C tmp
nanomsg:nanomsg-1.0.0
	$(export_env_val) && \
	cd tmp/$< && \
	./configure --prefix=$(PREFIX)  && \
	make clean; make && make install
