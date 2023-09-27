# The LCB board requires a custom boot.bin that is available on the topic downloads server.
DESCRIPTION = "Custom boot.bin for lcbzu9"
LICENSE = "CLOSED"

COMPATIBLE_MACHINE = "^lcbzu"

inherit deploy

PV = "7fa3b44ba92c"

BINFILE = "boot-lcbzu9-${PV}.bin"
SRC_URI = "https://topic.nl/downloads/${BINFILE}.xz"
SRC_URI[sha256sum] = "712dc316b324ab396e942465cd5a1ed7fe8e3ae614706418f6b400427b90ad3c"

S = "${WORKDIR}"

do_deploy () {
	install -d ${DEPLOYDIR}
	install ${S}/${BINFILE} ${DEPLOYDIR}/lcb-boot.bin
}
addtask deploy before do_build after do_compile

