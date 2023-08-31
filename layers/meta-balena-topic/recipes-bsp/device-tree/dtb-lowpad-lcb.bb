SUMMARY = "Devicetree overlay for FPGA image"
require recipes-bsp/device-tree/dtb-overlay.inc

COMPATIBLE_MACHINE = ".*"

BITSTREAM = "fpga-image-lowpad-lcb"

RDEPENDS:${PN} += "\
	kernel-module-topic-pl-fanctrl \
	kernel-module-uartlite \
	kernel-module-8250 kernel-module-8250-base kernel-module-8250-of \
	kernel-module-gpio-xilinx \
	kernel-module-i2c-xiic \
	kernel-module-xilinx-can \
	"
