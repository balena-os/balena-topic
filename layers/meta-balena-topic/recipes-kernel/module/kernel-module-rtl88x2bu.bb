LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://core/rtw_io.c;beginline=2;endline=8;md5=cd30f5806fdd68c2d204b403e8fef4f2"

MODULE = "${@d.getVar('PN', True).split('-', 2)[2]}"

inherit module gitpkgv

PV = "5.8.7.1+${SRCPV}"
PKGV = "5.8.7.1+${GITPKGV}"
S = "${WORKDIR}/git"
SRCREV = "${AUTOREV}"

SRC_URI = "git://github.com/cilynx/rtl88x2bu.git;branch=5.8.7.1_35809.20191129_COEX20191120-7777 \
           file://0001-Makefile-Sanitize-config-for-non-x86-platforms.patch \
           file://0002-Add-CONFIG_PLATFORM_OPENEMBEDDED-to-Makefile-as-defa.patch \
           file://0003-Don-t-use-__DATE__.patch \
"
SRC_URI[md5sum] = "1117c79a33f8c15ba32d19a68bdd91dc"

# Extra package to install for the board
MACHINE_EXTRA_RRECOMMENDS += "\
	kernel-module-rtl88x2bu \
	"

KERNEL_MODULE_AUTOLOAD += "rtl88x2bu"