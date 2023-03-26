# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2020 Roman Stratiienko (r.stratiienko@gmail.com)

PPP_PATH := $(patsubst $(CURDIR)/%,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

$(call inherit-product, $(PPP_PATH)/device.mk)

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

PRODUCT_BOARD_PLATFORM := rockchip
PRODUCT_NAME := pine64_pinephonepro
PRODUCT_DEVICE := pine64_pinephonepro
PRODUCT_BRAND := Pine64
PRODUCT_MODEL := PinePhonePro
PRODUCT_MANUFACTURER := Pine64
PRODUCT_HAS_EMMC := true

# EMMC
SYSFS_MMC0_PATH ?= fe330000.mmc
# SDCARD
SYSFS_MMC1_PATH ?= fe320000.mmc

UBOOT_DEFCONFIG := pinephone-pro-rk3399_defconfig
ATF_PLAT        := rk3399

DDR_BLOB := rk33/rk3399_ddr_933MHz_v1.25.bin
MINILOADER_BLOB := rk33/rk3399_miniloader_v1.26.bin
RKTRUST_INI := RK3399TRUST.ini
RK33_BIN := bin/rk33

KERNEL_DTB_FILE := rockchip/rk3399-pinephone-pro.dtb

GD_LCD_DENSITY := 269
