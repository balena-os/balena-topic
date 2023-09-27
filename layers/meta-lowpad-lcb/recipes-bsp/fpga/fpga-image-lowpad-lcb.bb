SUMMARY = "FPGA image for Lowpad"
require recipes-bsp/fpga/fpga-image.inc
LICENSE = "CLOSED"

COMPATIBLE_MACHINE = ".*"

BITSTREAM:tdpzu9 = "fpga-image-lowpad-lcb"

PV = "47+6a2b89e"
FPGA_BITFILE = "fpga-image-lowpad-lcb-lcb-${PV}.bit"
BOARD_DESIGN_URI = "https://topic.nl/downloads/${FPGA_BITFILE}.xz"

SRC_URI[sha256sum] = "c4a148e1d14a5b372d35baf24589ab62b98db93a43c445976b1907ed30b52b76"

PKGV = "${PV}"
S = "${WORKDIR}"
B = "${S}"

# Nothing to build
do_compile() {
    cp ${FPGA_BITFILE} fpga.bit
}
