DEPENDS += "balena-bootscript"

# Add components that we need to boot
IMAGE_INSTALL += "\
	bootscript \
	${IMAGE_INSTALL_MACHINE_EXTRAS} \
	"

BALENA_EXTRA_BOOT_FILES:zynqmp = "boot.bin:/boot.bin u-boot.itb:/u-boot.itb balena-bootscript.scr:/boot.scr"
BALENA_EXTRA_BOOT_FILES:zynq = "boot.bin:/boot.bin u-boot.img:/u-boot.img balena-bootscript.scr:/boot.scr"
BALENA_BOOT_PARTITION_FILES:append = " ${BALENA_EXTRA_BOOT_FILES}"

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

