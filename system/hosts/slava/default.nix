{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  time.timeZone = "Europe/Minsk";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixos";
    networkmanager = {enable = true;};
  };

  programs.fish.enable = true;

  system = {
    copySystemConfiguration = false;
  };
}
