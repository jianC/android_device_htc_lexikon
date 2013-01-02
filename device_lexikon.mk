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
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/etc/gps.conf:system/etc/gps.conf

DEVICE_PACKAGE_OVERLAYS += device/htc/lexikon/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/etc/voicemail-conf.xml:system/etc/voicemail-conf.xml \
    device/htc/lexikon/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml 

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/ramdisk/init.lexikon.rc:root/init.lexikon.rc \
    device/htc/lexikon/prebuilt/ramdisk/ueventd.lexikon.rc:root/ueventd.lexikon.rc

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

# vold config
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Input config files
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/lexikon/prebuilt/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/lexikon/prebuilt/system/usr/idc//lexikon-keypad.idc:system/usr/idc/lexikon-keypad.idc \
    device/htc/lexikon/prebuilt/system/usr/keylayout/lexikon-keypad.kl:system/usr/keylayout/lexikon-keypad.kl

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/system/usr/keychars/lexikon-keypad.kcm:system/usr/keychars/lexikon-keypad.kcm \
    device/htc/lexikon/prebuilt/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/lexikon/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/vendor/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/lexikon/prebuilt/vendor/firmware/BCM4329B1_002.002.023.0511.0538.hcd:system/etc/firmware/BCM4329B1_002.002.023.0511.0538.hcd \
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
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.oem.ecclist=112,911 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.def.agps.mode=6 \
    htc.audio.alt.enable=1 \
    htc.audio.hac.enable=1 \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.clientidbase.yt=android-htc \
    ro.com.google.clientidbase.am=android-verizon \
    ro.com.google.clientidbase.vs=android-verizon \
    ro.com.google.clientidbase.gmm=android-verizon \
    ro.com.google.clientidbase.ms=android-verizon \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r8 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.telephony.support_ipv6=true \
    persist.telephony.support_ipv4=true

# CameraHal
PRODUCT_PACKAGES += \
    camera.msm7x30

# Misc
PRODUCT_PACKAGES += \
    gps.lexikon \
    sensors.lexikon \
    lights.lexikon

$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/lexikon/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/lexikon/media_htcaudio.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := htc_lexikon
PRODUCT_DEVICE := lexikon
