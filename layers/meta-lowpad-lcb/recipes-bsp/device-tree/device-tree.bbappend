FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE:lcbzu9 = '.*'

SRC_URI:lcbzu9 = "\
	file://zynqmp-topic-miamiplusmp.dts \
	file://${MACHINE}.dts \
	"
