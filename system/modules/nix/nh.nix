{...}: {
  # nh default flake
  environment.variables.FLAKE = "/home/slava/nixos";

  programs.nh = {
    enable = true;
    # weekly cleanup
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
