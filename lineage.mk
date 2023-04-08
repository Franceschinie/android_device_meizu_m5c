#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/meizu/meizu

# Inherit some common Lineage OS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
# Use this to add NOTE_S to CM's lunch command menu
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/meizu/m5c/lineage_m5c.mk)

# Inherit device configuration
#$(call inherit-product, $(LOCAL_PATH)/device_m5c.mk)
#$(call inherit-product-if-exists, vendor/meizu/m5c/m5c-vendor.mk)

# Device branding
PRODUCT_RELEASE_NAME := m5c
PRODUCT_DEVICE := m5c
PRODUCT_NAME := lineage_m5c
PRODUCT_BRAND := Meizu
PRODUCT_MANUFACTURER := Meizu
PRODUCT_MODEL := Meizu m5c

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=meizu/x5623_h6013_meizu/x5623_h6013_meizu:6.0/MRA58K/1467902799:user/release-keys \
PRIVATE_BUILD_DESC="x5623_h6013_meizu-user 6.0 MRA58K 1502939649 release-keys"

# SuperUser
WITH_SU := false
WITH_ROOT := false

PRODUCT_GMS_CLIENTID_BASE := android-google
