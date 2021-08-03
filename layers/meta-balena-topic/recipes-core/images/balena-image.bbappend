DEPENDS += "balena-bootscript"

# Add components that we need to boot
IMAGE_INSTALL += "\
	bootscript \
	kernel-devicetree \
	${IMAGE_INSTALL_MACHINE_EXTRAS} \
	"

IMAGE_FSTYPES_zynqmp = "balenaos-img"
TOPIC_BOOT_PARTITION_FILES = "\
	boot.bin:/boot.bin u-boot.itb:/u-boot.itb \
	balena-bootscript.scr:/boot.scr \
	"
BALENA_BOOT_PARTITION_FILES_zynqmp = "${TOPIC_BOOT_PARTITION_FILES}"
BALENA_BOOT_PARTITION_FILES_zynq = "${TOPIC_BOOT_PARTITION_FILES}"

DEVICETREELINKS ??= "system.dtb ${DEVICETREE}"

# Postprocessing to reduce the amount of work to be done
# by configuration scripts
topicbalena_rootfs_postprocess() {
	echo -e "${DEVICETREELINKS}" | while read LINK TARGET
	do
		if [ -n "${TARGET}" ]
		then
			echo "DT: ${LINK}->${TARGET}"
			ln -s ${TARGET} ${IMAGE_ROOTFS}/boot/${LINK}
		fi
	done
}
ROOTFS_POSTPROCESS_COMMAND += "topicbalena_rootfs_postprocess; "

