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

LOCAL_PATH := device/meizu/m5c

BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Disable NINJA
#USE_NINJA := false

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += device/meizu/m5c/cmhw

# build without default recovery
# TARGET_NO_RECOVERY := true

##################################
#    **Odex Configuration**
#      true = Odexed Rom
#      false = Deodexed Rom
#      null = Rom source decides
##################################
ODEX := false

ifeq ($(ODEX),true)
    WITH_DEXPREOPT := true
    DISABLE_DEXPREOPT := false
endif

ifeq ($(ODEX),false)
    WITH_DEXPREOPT := false
    DISABLE_DEXPREOPT := true
endif

# Platform
TARGET_BOARD_PLATFORM := mt6737m

# Architecture (32bit / 64bit)
#FORCE_32_BIT = true
MTK_K64_SUPPORT = yes

ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
endif

#TARGET_SUPPORTS_32_BIT_APPS := 
#TARGET_SUPPORTS_64_BIT_APPS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6737m

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/rootdir/kernel

BOARD_KERNEL_BASE = 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET = 0x03f88000
BOARD_TAGS_OFFSET = 0x0df88000
ifeq ($(FORCE_32_BIT),true)
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_CMDLINE = bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET = 0x00008000
else
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_CMDLINE = bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET = 0x00080000
TARGET_USES_64_BIT_BINDER := true
endif
#BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET) --board m5c_V0
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET) --board mt6737

BOARD_CUSTOM_BOOTIMG := true

TARGET_KMODULES := true

# make_ext4fs requires numbers in dec format
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12831948800
BOARD_FLASH_BLOCK_SIZE := 4096

# Assert
TARGET_OTA_ASSERT_DEVICE := m5c,m710h

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

TARGET_PROVIDES_LIBLIGHT := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_MTK_MEDIA_PROFILES := true
BOARD_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# OMX
TARGET_OMX_LEGACY_RESCALING := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# SU
WITH_SU := false

# RIL
BOARD_RIL_CLASS := ../../../device/meizu/m5c/ril

BOARD_DISABLE_HW_ID_MATCH_CHECK := true

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# GPS
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# CWM
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/root/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/rootdir/kernel
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP stuff
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
TW_NO_CPU_TEMP := true
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32

# sepolicy
BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy

# Use old sepolicy version
POLICYVERS := 29

# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp

#TARGET_LDPRELOAD += libxlog.so:libmtk_symbols.so

MTK_GPU_VERSION := mali midgard r7p0

# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
