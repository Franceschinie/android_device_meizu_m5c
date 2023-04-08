# LineageOS 14.1 device tree for Meizu M5c 

Meizu M5c
==============

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 1.3GHz Quad-Core MT6737
GPU     | Mali-T720
Memory  | 2GB RAM
Shipped Android Version | 6.0
Storage | 16GB
Battery | 3000 mAh
Display | 5" 720 x 1280 px
Camera  | Front: 5.0MPx, Back 8MPx, LED Flash

![m5c](https://cdn-files.kimovil.com/default/0001/71/thumb_70651_default_big.jpeg "Meizu M5c")

# Instructions
```
repo init -u git://github.com/LineageOS/android.git -b cm-14.1
repo sync
git https://github.com/XRedCubeX/android_device_meizu_m5c.git -b cm-14.1 device/meizu/m5c
./device/meizu/m5c/patches_mtk/apply-patches.sh
. build/envsetup.sh
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8g"
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server
brunch m5c
```

# Acknowledgements

* seluce
* iodine71
* olegsvs
* danielhk
* Zormax
* xcore995
* SRTK
* and others I might have forgotten to include
