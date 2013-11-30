# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lexikon

TARGET_RECOVERY_FSTAB = device/htc/lexikon/prebuilt/root/fstab.lexikon

BOARD_USES_QCOM_AUDIO_VOIPMUTE := false
BOARD_USES_QCOM_AUDIO_RESETALL := false
BOARD_HAVE_HTC_AUDIO := true

# Kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_RECOVERY_CMDLINE := $(BOARD_KERNEL_CMDLINE) msmsdcc_power_gpio=88
BOARD_KERNEL_BASE := 0x04a00000
BOARD_KERNEL_PAGE_SIZE := 4096

TARGET_KERNEL_SOURCE := kernel/htc/msm7x30
TARGET_KERNEL_CONFIG := evervolv_lexikon_defconfig
ARM_EABI_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilt/linux-x86/toolchain/arm-linux-linaro-4.7/bin

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := lexikon
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
TARGET_QCOM_HDMI_OUT := false

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# cat /proc/emmc
# dev:        size     erasesize name
# mmcblk0p17: 00040000 00000200 "misc"
# mmcblk0p21: 0087f400 00000200 "recovery"
# mmcblk0p22: 00400000 00000200 "boot"
# mmcblk0p25: 1ffbfa00 00000200 "system"
# mmcblk0p28: 00140200 00000200 "local"
# mmcblk0p27: 0f9ffe00 00000200 "cache"
# mmcblk0p26: 4a4b4200 00000200 "userdata"
# mmcblk0p29: 01400000 00000200 "devlog"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536608768
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1246445568
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_FLASH_BLOCK_SIZE := 262144

# Recovery
BOARD_TOUCH_RECOVERY := true
BOARD_HAS_NO_SELECT_BUTTON := true
