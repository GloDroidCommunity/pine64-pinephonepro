# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2019 The Android Open-Source Project

BC_PATH := $(patsubst $(CURDIR)/%,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

include glodroid/configuration/common/board-common.mk

BOARD_MESA3D_GALLIUM_DRIVERS := panfrost

BOARD_KERNEL_CMDLINE += earlyprintk console=ttyS2,1500000n8 printk.devkmsg=on printk.time=1

BOARD_VENDOR_SEPOLICY_DIRS += $(BC_PATH)/sepolicy/vendor

BOARD_LIBCAMERA_IPAS := rkisp1
BOARD_LIBCAMERA_PIPELINES := rkisp1

BOARD_LIBCAMERA_EXTRA_TARGETS := \
    libetc:libcamera/ipa_rkisp1.so:libcamera:ipa_rkisp1.so:           \
    libetc:libcamera/ipa_rkisp1.so.sign:libcamera:ipa_rkisp1.so.sign: \

KERNEL_FRAGMENTS := $(BC_PATH)/kernel.config
KERNEL_DEFCONFIG := $(BC_PATH)/pinephone_pro_defconfig

BOARD_KERNEL_SRC_DIR := glodroid/kernel/mainline-6.3
BOARD_KERNEL_PATCHES_DIRS := \
	$(BC_PATH)/patches-kernel-6.3/google-6.3 \
	$(BC_PATH)/patches-kernel-6.3/glodroid-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-af8133j-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-anx-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-axp-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-bt-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-cam-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-modem-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-ppkb-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-ppp-drivers-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-ppp-dt-6.3 \
	$(BC_PATH)/patches-kernel-6.3/megi-wifi-6.3 \

GD_BOOTSCRIPT_OVERLAY_DEVICE := $(BC_PATH)/boot/bootscript_device_overlay.h
