# Specify phone tech before including full_phone
$(call inherit-product, vendor/ev/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := lexikon

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/lexikon/device_lexikon.mk)

# Device naming
PRODUCT_DEVICE := lexikon
PRODUCT_NAME := ev_lexikon
PRODUCT_BRAND := htc
PRODUCT_MODEL := ADR6325
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_lexikon BUILD_FINGERPRINT=us_cellular_wwe/htc_lexikon/lexikon:2.3.4/GRJ22/325543.1:user/release-keys PRIVATE_BUILD_DESC="3.20.573.1 CL325543 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Quovis
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Merge\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

#PRODUCT_PACKAGES += \
#    Camera

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/hot_reboot

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip

# USB
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage
