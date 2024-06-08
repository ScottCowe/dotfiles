{ lib, config, pkgs, ... }:

with lib; {
  options.common.quickemu = {
    enable = mkEnableOption "quickemu";
  };

  config = mkIf config.common.quickemu.enable {
    home.packages = with pkgs; [
      quickemu
      (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
        qemu-system-x86_64 \
          -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
          "$@"
      '')
    ];
  };
}
