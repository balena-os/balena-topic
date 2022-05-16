FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

inherit resin-u-boot
UBOOT_KCONFIG_SUPPORT = "1"
