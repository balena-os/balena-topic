SUMMARY = "FPGA image for Lowpad"
require recipes-bsp/fpga/fpga-image.inc
LICENSE = "CLOSED"

COMPATIBLE_MACHINE = ".*"

BITSTREAM:tdpzu9 = "fpga-image-lowpad-lcb"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PV = "45+110a993"
FPGA_BITFILE = "fpga-image-lowpad-lcb-lcb-${PV}.bit"

SRC_URI = "file://fpga-image-lowpad-lcb-lcb-${PV}.bit.xz"
SRC_URI[sha256sum] = "fd03f553151b75da41afd34e92c83f65bbab0a682fd4ebb4d5fb8937ce7e785a"

PKGV = "${PV}"
S = "${WORKDIR}"
B = "${S}"

# Nothing to build
do_compile() {
    rm -f fpga.bit
    ln ${FPGA_BITFILE}.bit fpga.bit
}
