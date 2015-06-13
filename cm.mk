# Release name
PRODUCT_RELEASE_NAME := lexikon

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/lexikon/device_lexikon.mk)

# Device naming
PRODUCT_DEVICE := lexikon
PRODUCT_NAME := cm_lexikon
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC Merge
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_lexikon BUILD_FINGERPRINT=us_cellular_wwe/htc_lexikon/lexikon:2.3.4/GRJ22/325543.1:user/release-keys PRIVATE_BUILD_DESC="3.20.573.1 CL325543 release-keys"

# Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
TARGET_BOOTANIMATION_HALF_RES := true
