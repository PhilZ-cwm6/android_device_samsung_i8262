## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := GalaxyCoreDuos

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i8262/device_i8262.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i8262
PRODUCT_NAME := cm_i8262
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-i8262
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=arubaslimxx TARGET_DEVICE=arubaslim BUILD_FINGERPRINT=samsung/arubaslimxx/arubaslim:4.1.2/JZO54K/I8262XXAMG6:user/release-keys PRIVATE_BUILD_DESC="arubaslimxx-user 4.1.2 JZO54K I8262XXAMG6 release-keys"
