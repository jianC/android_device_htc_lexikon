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

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/lexikon/overlay

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/root/init.lexikon.rc:root/init.lexikon.rc \
    device/htc/lexikon/prebuilt/root/fstab.lexikon:root/fstab.lexikon \
    device/htc/lexikon/prebuilt/root/ueventd.lexikon.rc:root/ueventd.lexikon.rc

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

# vold config
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Input config files
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/lexikon/prebuilt/system/usr/idc/lexikon-keypad.idc:system/usr/idc/lexikon-keypad.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/usr/keychars/lexikon-keypad.kcm:system/usr/keychars/lexikon-keypad.kcm \
    device/htc/lexikon/prebuilt/system/usr/keylayout/lexikon-keypad.kl:system/usr/keylayout/lexikon-keypad.kl \
    device/htc/lexikon/prebuilt/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/lexikon/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/lexikon/prebuilt/system/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/vendor/firmware/bcm4329.hcd:vendor/firmware/bcm4329.hcd \
    device/htc/lexikon/prebuilt/vendor/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/lexikon/prebuilt/vendor/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/lexikon/prebuilt/vendor/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb

# OMX Config Profiles
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/etc/vomeComp_RTSP.cfg:system/etc/vomeComp_RTSP.cfg \
    device/htc/lexikon/prebuilt/system/etc/vomeComp.cfg:system/etc/vomeComp.cfg \
    device/htc/lexikon/prebuilt/system/etc/vomeCore.cfg:system/etc/vomeCore.cfg \
    device/htc/lexikon/prebuilt/system/etc/vomeplay.cfg:system/etc/vomeplay.cfg \
    device/htc/lexikon/prebuilt/system/etc/vommcodec.cfg:system/etc/vommcodec.cfg \
    device/htc/lexikon/prebuilt/system/etc/voPDLog.cfg:system/etc/voPDLog.cfg \
    device/htc/lexikon/prebuilt/system/etc/voVidDec.dat:system/etc/voVidDec.dat

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.def.agps.mode=6 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r8 \
    ro.setupwizard.enable_bypass=1 \
    ro.kernel.android.checkjni=0

# Misc
PRODUCT_PACKAGES += \
    gps.lexikon

# Broadcom firmware
PRODUCT_PACKAGES += \
    fw_bcm4329.bin \
    fw_bcm4329_apsta.bin

$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/lexikon/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/lexikon/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
