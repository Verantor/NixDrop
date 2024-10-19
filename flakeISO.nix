{
  description = "Bcachefs enabled installation media";
  inputs.nixos.url = "nixpkgs/nixos-24.05";
  outputs = { self, nixos }: {
    nixosConfigurations = {
      exampleIso = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
          ({ lib, pkgs, ... }: {
            # Might be required as a workaround for bug
            # https://github.com/NixOS/nixpkgs/issues/32279
            environment.systemPackages = [ pkgs.keyutils git vim];
            boot.supportedFilesystems = [ "bcachefs" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

          })
        ];
      };
    };
  };
}
