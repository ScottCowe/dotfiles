{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.beta;
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "535.154.05";
      sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
      sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
      openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
      settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
      persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
    };
  };  

  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "wooting_udev";
      destination = "/etc/udev/rules.d/70-wooting.rules";
      text = ''
        # Wooting One Legacy
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
        # Wooting One update mode 
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"

        # Wooting Two Legacy
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
        # Wooting Two update mode  
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", TAG+="uaccess"

        # Generic Wootings
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
      '';
    })
  ];

  environment.systemPackages = with pkgs; [
    wootility
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "cowe" ];

  services.logmein-hamachi.enable = true;

  programs.noisetorch.enable = true;
}
