# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2020 Roman Stratiienko (r.stratiienko@gmail.com)

$(call inherit-product, glodroid/configuration/common/device-common.mk)

# Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/dptx.bin:$(TARGET_COPY_OUT_RAMDISK)/vendor/etc/firmware/rockchip/dptx.bin \
    $(LOCAL_PATH)/firmware/regulatory.db:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/regulatory.db \
    $(LOCAL_PATH)/firmware/regulatory.db.p7s:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/regulatory.db.p7s \
    $(LOCAL_PATH)/firmware/brcmfmac43455-sdio.bin:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/brcm/brcmfmac43455-sdio.bin \
    $(LOCAL_PATH)/firmware/brcmfmac43455-sdio.txt:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/brcm/brcmfmac43455-sdio.txt \
    $(LOCAL_PATH)/firmware/brcmfmac43455-sdio.clm_blob:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/brcm/brcmfmac43455-sdio.clm_blob \
    $(LOCAL_PATH)/firmware/BCM4345C0.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/brcm/BCM4345C0.hcd \

# Checked by android.opengl.cts.OpenGlEsVersionTest#testOpenGlEsVersion. Required to run correct set of dEQP tests.
# 196609 == 0x00030001 == GLES v3.1
PRODUCT_VENDOR_PROPERTIES += \
    ro.opengles.version=196609 \

# Lights HAL
PRODUCT_PACKAGES += \
    android.hardware.lights-service.pinephonepro \

# Sensors HAL
PRODUCT_PACKAGES += \
    sensors.iio \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.sensors=iio                            \
    ro.iio.accel.mpu6500.name=MPU6500_Accelerometer    \
    ro.iio.accel.quirks=no-trig,no-event               \
    ro.iio.anglvel.mpu6500.name=MPU6500_Gyroscope      \
    ro.iio.anglvel.quirks=no-trig,no-event             \
    ro.iio.magn.af8133j.name=AF8133J_Magnetometer      \
    ro.iio.magn.quirks=no-trig,no-event                \

# Camera
PRODUCT_PACKAGES += \
    ipa_rkisp1.so      \
    ipa_rkisp1.so.sign \

LIBCAMERA_CFGS := $(wildcard glodroid/vendor/libcamera/src/ipa/rkisp1/data/*yaml)
PRODUCT_COPY_FILES += $(foreach cfg,$(LIBCAMERA_CFGS),$(cfg):$(TARGET_COPY_OUT_VENDOR)/etc/libcamera/ipa/rkisp1/$(notdir $(cfg))$(space))


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/modem.pinephonepro.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/modem.pinephonepro.rc \
    $(LOCAL_PATH)/etc/uevent.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/uevent.device.rc \
    $(LOCAL_PATH)/etc/camera_hal.yaml:$(TARGET_COPY_OUT_VENDOR)/etc/libcamera/camera_hal.yaml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/audio.pinephonepro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio.pine64_pinephonepro.xml \

# Camera IPAs
PRODUCT_PACKAGES += ipa_rkisp1 ipa_rkisp1.so.sign
