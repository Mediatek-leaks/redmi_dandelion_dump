#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:0cf66548d226771585938c69bd46875f38e4fae1; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:1d0412e6af90b4fac6cdb9ef6e49a0899e74ca01 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:0cf66548d226771585938c69bd46875f38e4fae1 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
