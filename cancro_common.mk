#
# Copyright 2014 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
LOCAL_PATH := device/xiaomi/msm8974-common
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/sidnid-conf.xml:system/etc/sidnid-conf.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Default Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=MI.ogg \
    ro.config.notification_sound=FadeIn.ogg \
    ro.config.alarm_alert=GoodMorning.ogg

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/FadeIn.ogg:system/media/audio/notifications/FadeIn.ogg \
    $(LOCAL_PATH)/media/FadeOut.ogg:system/media/audio/notifications/FadeOut.ogg \
    $(LOCAL_PATH)/media/GoodMorning.ogg:system/media/audio/alarms/GoodMorning.ogg \
    $(LOCAL_PATH)/media/MI.ogg:system/media/audio/ringtones/MI.ogg

# include additional build utilities
-include $(LOCAL_PATH)/utils.mk

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RESTRICT_VENDOR_FILES := false

# This device is xxhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xxhdpi density so
# we do this little trick to fall back to the xhdpi version
# if the xxhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, $(LOCAL_PATH)/common.mk)
$(call inherit-product, vendor/xiaomi/cancro/cancro-vendor.mk)
