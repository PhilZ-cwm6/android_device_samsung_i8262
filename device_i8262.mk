$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/i8262/i8262-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/i8262/overlay

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/i8262/ramdisk/fstab.qcom:root/fstab.qcom

# Recovery
PRODUCT_COPY_FILES += \
    device/samsung/i8262/recovery/extra.fstab:recovery/root/etc/extra.fstab \
    device/samsung/i8262/recovery/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery \
    device/samsung/i8262/recovery/recovery.do:recovery/root/res/recovery.do

# Charger
PRODUCT_COPY_FILES += \
    device/samsung/i8262/charger/battery_0.png:recovery/root/res/images/charger/battery_0.png \
    device/samsung/i8262/charger/battery_1.png:recovery/root/res/images/charger/battery_1.png \
    device/samsung/i8262/charger/battery_2.png:recovery/root/res/images/charger/battery_2.png \
    device/samsung/i8262/charger/battery_3.png:recovery/root/res/images/charger/battery_3.png \
    device/samsung/i8262/charger/battery_4.png:recovery/root/res/images/charger/battery_4.png \
    device/samsung/i8262/charger/battery_5.png:recovery/root/res/images/charger/battery_5.png \
    device/samsung/i8262/charger/battery_charge.png:recovery/root/res/images/charger/battery_charge.png \
    device/samsung/i8262/charger/battery_fail.png:recovery/root/res/images/charger/battery_fail.png

# FM Radio
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni

# Media
PRODUCT_COPY_FILES += \
    device/samsung/i8262/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/i8262/media/media_codecs.xml:system/etc/media_codecs.xml

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    device/samsung/i8262/prebuilt/usr/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/samsung/i8262/prebuilt/usr/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/samsung/i8262/prebuilt/usr/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/samsung/i8262/prebuilt/usr/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/samsung/i8262/prebuilt/usr/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage,adb \
    persist.service.adb.enable=1 \
    ro.adb.secure=0

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

# Misc other modules
PRODUCT_PACKAGES += \
    audio_policy.msm7x27a \
    audio.primary.msm7x27a

# Device-specific packages
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    SystemUI \
    Settings

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Support for Browser's saved page feature. This allows
PRODUCT_PACKAGES += \
    libskia_legacy

# enable Google-specific location features,
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
    dalvik.vm.checkjni=0

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    ro.telephony.ril_class=SamsungQualcommRIL \
    ro.telephony.call_ring.multiple=0

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_i8262
PRODUCT_DEVICE := i8262
