Android 9 Pie source for Rock64

Get repo here: https://source.android.com/setup/build/downloading#installing-repo

There are two manifests, one for US and one for China. 
The China one uses AOSP mirrors located in China.

```
repo init --depth=1 -u https://github.com/a9rock64/manifests.git -m a9rock64_us.xml -b default
repo init --depth=1 -u https://github.com/a9rock64/manifests.git -m a9rock64_china.xml -b default
```

Bring the files down using parallel threads, about half an hour

```
repo sync  -f -c --no-clone-bundle --no-tags -j$(nproc --all)
```

To build, five or six hours

```
. build/envsetup.sh
./build_box.sh
```

rkdeveloptool is here: http://opensource.rock-chips.com/wiki_Rkdeveloptool

Get the board into bootrom mode

```
cd rockdev/Image-rk3328_box
rkdeveloptool db MiniLoaderAll.bin
rkdeveloptool ef
rkdeveloptool gpt parameter.txt
rkdeveloptool ppt
rkdeveloptool ul MiniLoaderAll.bin
rkdeveloptool wlx uboot uboot.img
rkdeveloptool wlx trust trust.img
rkdeveloptool wlx misc misc.img
rkdeveloptool wlx baseparameter baseparameter.img
rkdeveloptool wlx resource resource.img
rkdeveloptool wlx kernel kernel.img
rkdeveloptool wlx dtbo dtbo.img
rkdeveloptool wlx vbmeta vbmeta.img
rkdeveloptool wlx boot boot.img
rkdeveloptool wlx recovery recovery.img
rkdeveloptool wlx system system.img
rkdeveloptool wlx vendor vendor.img
rkdeveloptool wlx oem oem.img
rkdeveloptool rd
```

