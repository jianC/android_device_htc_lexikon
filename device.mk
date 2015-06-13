#
# Copyright (C) 2011 The CyanogenMod Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# HTC Audio
$(call inherit-product, device/htc/lexikon/media_a1026.mk)
$(call inherit-product, device/htc/lexikon/media_htcaudio.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/lexikon/overlay

# call the proprietary setup
$(call inherit-product, vendor/htc/lexikon/lexikon-vendor.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/root/init.lexikon.rc:root/init.lexikon.rc \
    device/htc/lexikon/prebuilt/root/init.htc7x30.usb.rc:root/init.htc7x30.usb.rc \
    device/htc/lexikon/prebuilt/root/fstab.lexikon:root/fstab.lexikon \
    device/htc/lexikon/prebuilt/root/ueventd.lexikon.rc:root/ueventd.lexikon.rc

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

# Input config files
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/lexikon/prebuilt/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/lexikon/prebuilt/system/usr/idc/lexikon-keypad.idc:system/usr/idc/lexikon-keypad.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/usr/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/lexikon/prebuilt/system/usr/keychars/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/lexikon/prebuilt/system/usr/keychars/lexikon-keypad.kcm:system/usr/keychars/lexikon-keypad.kcm \
    device/htc/lexikon/prebuilt/system/usr/keylayout/lexikon-keypad.kl:system/usr/keylayout/lexikon-keypad.kl \
    device/htc/lexikon/prebuilt/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/lexikon/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/lexikon/prebuilt/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/lexikon/prebuilt/system/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/vendor/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/lexikon/prebuilt/vendor/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/lexikon/prebuilt/vendor/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/lexikon/prebuilt/vendor/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.def.agps.mode=6 \
    ro.config.low_ram=true \
	ro.ksm.default=1

# Misc
PRODUCT_PACKAGES += \
	libbt-vendor \
	lights.spade \
	sensors.spade \
    gps.lexikon \
    librpc

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.enable_bypass=1

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vold.umsdirtyratio=20

# Use cache partition for system app dexopt
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US

ifeq ($(DISABLE_SECURITY),true)
# Disable ADB authentication and use root shell
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0
endif

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# lower the increment
ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.heapgrowthlimit=36m
