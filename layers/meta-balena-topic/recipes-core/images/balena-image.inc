DEPENDS += "balena-bootscript"

BALENA_BOOT_BIN ?= ""
DEPENDS += "${BALENA_BOOT_BIN}"

# Add components that we need to boot
IMAGE_INSTALL += "\
	bootscript \
	kernel-module-rtl88x2bu \
	iperf3 \
	${IMAGE_INSTALL_MACHINE_EXTRAS} \
	"

BALENA_EXTRA_BOOT_FILES:zynqmp = "boot.bin:/boot.bin u-boot.itb:/u-boot.itb balena-bootscript.scr:/boot.scr"
BALENA_EXTRA_BOOT_FILES:zynq = "boot.bin:/boot.bin u-boot.img:/u-boot.img balena-bootscript.scr:/boot.scr"
BALENA_EXTRA_BOOT_FILES:lcbzu9 = "lcb-boot.bin:/boot.bin u-boot.itb:/u-boot.itb balena-bootscript.scr:/boot.scr"

DEVICETREELINKS ??= "system.dtb ${DEVICETREE}"

# Postprocessing to reduce the amount of work to be done
# by configuration scripts
topicbalena_rootfs_postprocess() {
	/bin/echo -e "${DEVICETREELINKS}" | while read LINK TARGET
	do
		if [ -n "${TARGET}" ]
		then
			/bin/echo "DT: ${LINK}->${TARGET}"
			ln -s ${TARGET} ${IMAGE_ROOTFS}/boot/${LINK}
		fi
	done
}
ROOTFS_POSTPROCESS_COMMAND += "topicbalena_rootfs_postprocess; "


# Sizes in KiB. 
# We need to increase the rootfs size to make space for additional drivers in ROOTFS. 
# BalenaOS image has a 700MB max size defined in 'image_types_balena.bbclass'
IMAGE_ROOTFS_SIZE="409600"

# We require access to the git repository here, so we must run outside fakeroot
do_addrevisioninfo() {
	git rev-parse --verify --short HEAD >> ${IMAGE_ROOTFS}${sysconfdir}/revision
}
addtask do_addrevisioninfo before do_image after do_rootfs