# BalenaOS boots from the first FAT partition. This script just passes on
# control to the next boot partition
DESCRIPTION = "U-Boot Bootscript for BalenaOS"
SECTION = "bootloaders"
PRIORITY = "optional"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
PV = "0"

inherit uboot_bootscript deploy
PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI = "file://boot.scr"

S = "${WORKDIR}"

do_compile () {
	oe_mkimage_script -n "autorun" -d ${WORKDIR}/boot.scr ${S}/boot.uimage.scr
}

do_install () {
	install -d ${D}/boot
	install ${S}/boot.uimage.scr ${D}/boot/${BPN}.scr
}

do_deploy () {
	install -d ${DEPLOYDIR}
	install ${S}/boot.uimage.scr ${DEPLOYDIR}/${BPN}.scr
}
addtask deploy before do_build after do_compile

FILES:${PN} = "/boot"

do_configure[noexec] = "1"
