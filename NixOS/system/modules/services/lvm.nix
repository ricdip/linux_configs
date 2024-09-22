{
  # TODO: LVM
  # boot.initrd = {
  #  # appends kernel modules for LVM cache to initrd
  #  kernelModules = [ "dm-cache" "dm-cache-smq" ];
  # };

  # services.lvm = {
  #  # enables lvm2
  #  enable = true;
  #  # solves "missing cache_check" warning
  #  boot.thin.enable = true;
  # };
}
