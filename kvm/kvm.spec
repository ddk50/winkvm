Name:           kvm
Version:        0.0
Release:        0
Summary:        Kernel Virtual Machine virtualization environment

Group:          System Environment/Kernel
License:        GPL
URL:            http://www.qumranet.com
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}

ExclusiveArch:  i386 x86_64

Requires:	kvm-kmod bridge-utils

%define fedora_release %(rpm -q --qf '%%{version}' fedora-release)

%if %{fedora_release} == 5
BuildRequires: compat-gcc-32
%else
BuildRequires: compat-gcc-34
%endif

BuildRequires:  SDL-devel zlib-devel alsa-lib-devel

%define _prebuilt %{?prebuilt:1}%{!?prebuilt:0}

%if !%{_prebuilt}
Source0: kvm.tar.gz
Source1: user.tar.gz
Source2: kernel.tar.gz
Source3: scripts.tar.gz
Source4: Makefile
Source5: configure
%endif

%description
The Kernel Virtual Machine provides a virtualization enviroment for processors
with hardware support for virtualization: Intel's VT and AMD's AMD-V.

%prep

%if !%{_prebuilt}
%setup -T -b 0 -n qemu
%setup -T -b 1 -n user -D
%setup -T -b 2 -n kernel -D
%setup -T -b 3 -n scripts -D
cd ..
cp %{_sourcedir}/Makefile %{_sourcedir}/configure .
%endif

%build

rm -rf %{buildroot}

%if !%{_prebuilt}
cd ..
./configure --prefix=/usr/kvm
make -C user
#(cd qemu;
#    ./co
#   kpath="$(readlink -f ../kernel/include)"
#   upath="$(readlink -f ../user)"
#   ./configure --target-list=$(uname -i)-softmmu \
#	    --extra-cflags="-I$kpath -I$upath" \
#	    --extra-ldflags="-L$upath" \
#	    --disable-kqemu --enable-kvm --prefix=/usr/kvm
#)
make -C qemu
%endif

%install

%if !%{_prebuilt}
cd ..
%else
cd %{objdir}
%endif

make DESTDIR=%{buildroot} install-rpm

%define bindir /usr/bin
%define bin %{bindir}/kvm
%define initdir /etc/init.d
%define confdir /etc/kvm
%define utilsdir /etc/kvm/utils

%post 
/sbin/chkconfig --level 2345 kvm on
/sbin/chkconfig --level 16 kvm off
/usr/sbin/groupadd -fg 444 kvm

%postun

%clean
%{__rm} -rf %{buildroot}

%files
/usr/bin/kvm
%{confdir}/qemu-ifup
%{initdir}/kvm  
/etc/udev/rules.d/*kvm*.rules
/usr/kvm
/usr/kvm/**
%changelog
