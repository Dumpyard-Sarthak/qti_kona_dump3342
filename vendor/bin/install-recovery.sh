#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:b2af3bd10d97aa9d4761f93a4d16e1c061978b13; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:506522efe80e633476d3f071ab2497d701819b6e \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:b2af3bd10d97aa9d4761f93a4d16e1c061978b13 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
