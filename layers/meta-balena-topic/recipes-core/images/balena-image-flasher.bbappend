include balena-image.inc

# Provide any deltas required for the flasher image
BALENA_BOOT_PARTITION_FILES:append = " ${BALENA_EXTRA_BOOT_FILES}\
"
