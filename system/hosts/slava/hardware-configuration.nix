{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.kernelModules = [""];
  boot.supportedFilesystems = [""];

  boot.kernelPackages = pkgs.linuxPackages_latest;

fileSystems."/" =
    { device = "/dev/disk/by-uuid/5b99438f-18c4-4a26-bca6-8de36111330e";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8A14-5EB3";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/239dcc9c-7c14-4c01-b5e8-aab84ed12ce8"; }
    ];

    networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}
