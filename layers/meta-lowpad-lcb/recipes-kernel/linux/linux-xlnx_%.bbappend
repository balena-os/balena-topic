FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

TOPICBSPCONFIG:lcbzu9 = "\
    file://topic-miamimp-standard.cfg \
    file://topic-miamiplusmp-extra.cfg \
    file://tdpzu-extra.cfg \
    file://usb-wired-network-adapters.cfg \
    file://lcb-network.cfg \
    file://lcb-perf.cfg \
    file://lcb-wireless.cfg \
    file://lcb-can.cfg \
    "

SRC_URI:append = "\
    file://0001-net-dsa-mv88e6xxx-support-RGMII-cmode.patch \
    file://0001-net-dsa-mv88e6xxx-Configure-port-0.patch \
    file://0001-rtc-pcf85363-Allow-to-wake-up-system-without-IRQ.patch \
    file://0001-dma-axi-dmac-simple-device_config-operation-implemen.patch \
    file://0001-sound-soc-codecs-spdif_transmitter-less-restrictions.patch \
    file://0002-sound-soc-Add-topic-pwm-audio.patch \
    file://0001-usb-misc-usb5807-Add-driver.patch \
    file://0002-usb5807-backport-to-5.15.patch \
    file://0001-iio-adc-Add-driver-for-microchip-MCP3561-2-4R-device.patch \
    "