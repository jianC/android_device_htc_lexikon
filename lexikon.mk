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

# The gps config appropriate for this device

PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/lexikon/init.lexikon.rc:root/init.lexikon.rc \
    device/htc/lexikon/ueventd.lexikon.rc:root/ueventd.lexikon.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml
##    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
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
    ro.cdma.home.operator.numeric = 310012 \
    ro.cdma.home.operator.alpha = Verizon \
    persist.telephony.support_ipv6=true \
    persist.telephony.support_ipv4=true

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/lexikon/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/lexikon/voicemail-conf.xml:system/etc/voicemail-conf.xml \
    device/htc/lexikon/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_PACKAGES += \
    lights.lexikon \
    sensors.lexikon \
    gps.lexikon

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/lexikon/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/lexikon/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad.kcm.bin:system/usr/keychars/lexikon-keypad.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-ara.kcm.bin:system/usr/keychars/lexikon-keypad-ara.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-ell.kcm.bin:system/usr/keychars/lexikon-keypad-ell.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-fra.kcm.bin:system/usr/keychars/lexikon-keypad-fra.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-ger.kcm.bin:system/usr/keychars/lexikon-keypad-ger.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-ita.kcm.bin:system/usr/keychars/lexikon-keypad-ita.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-tur.kcm.bin:system/usr/keychars/lexikon-keypad-tur.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-wwe-bopomo.kcm.bin:system/usr/keychars/lexikon-keypad-wwe-bopomo.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad-wwe.kcm.bin:system/usr/keychars/lexikon-keypad-wwe.kcm.bin

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/lexikon/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/lexikon/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/lexikon/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/lexikon/keylayout/lexikon-keypad.kl:system/usr/keylayout/lexikon-keypad.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-ara.kl:system/usr/keylayout/lexikon-keypad-ara.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-ell.kl:system/usr/keylayout/lexikon-keypad-ell.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-fra.kl:system/usr/keylayout/lexikon-keypad-fra.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-ger.kl:system/usr/keylayout/lexikon-keypad-ger.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-ita.kl:system/usr/keylayout/lexikon-keypad-ita.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-tur.kl:system/usr/keylayout/lexikon-keypad-tur.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-wwe-bopomo.kl:system/usr/keylayout/lexikon-keypad-wwe-bopomo.kl \
    device/htc/lexikon/keylayout/lexikon-keypad-wwe.kl:system/usr/keylayout/lexikon-keypad-wwe.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/lexikon/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/lexikon/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/lexikon/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/lexikon/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/lexikon/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb \
    device/htc/lexikon/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/lexikon/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/lexikon/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/lexikon/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/lexikon/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/lexikon/dsp/AdieHWCodec_NEL.csv:system/etc/AdieHWCodec_NEL.csv \
    device/htc/lexikon/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/lexikon/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/lexikon/dsp/AIC3254_REG_DualMic_NEL.csv:system/etc/AIC3254_REG_DualMic_NEL.csv \
    device/htc/lexikon/dsp/AIC3254_REG_DualMicXB.csv:system/etc/AIC3254_REG_DualMicXB.csv \
    device/htc/lexikon/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/lexikon/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/lexikon/dsp/TPA2051_CFG_NEL.csv:system/etc/TPA2051_CFG_NEL.csv \
    device/htc/lexikon/dsp/CodecDSPID_BCLK.txt:system/etc/CodecDSPID_BCLK.txt \
    device/htc/lexikon/dsp/CodecDSPID_NEL.txt:system/etc/CodecDSPID_NEL.txt \
    device/htc/lexikon/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/lexikon/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/lexikon/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Original_BCLK.txt:system/etc/soundimage/Sound_Original_BCLK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Original_Recording_BCLK.txt:system/etc/soundimage/Sound_Original_Recording_BCLK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Original_SPK_BCLK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_HP_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_HP_BCLK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_REC_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_REC_BCLK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_SPK_BCLK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/lexikon/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/lexikon/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/lexikon/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/lexikon/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/lexikon/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt
 
PRODUCT_COPY_FILES += \
    device/htc/lexikon/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/lexikon/media_profiles.xml:system/etc/media_profiles.xml

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/lexikon/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/lexikon/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/lexikon/media_htcaudio.mk)

$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

PRODUCT_NAME := htc_lexikon
PRODUCT_DEVICE := lexikon
PRODUCT_MODEL := HTC Incredible 2
PRODUCT_MANUFACTURER := HTC
