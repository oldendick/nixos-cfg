# /etc/nixos/flake.nix
# to build this config, cd /etc/nixos; then:
# sudo nixos-rebuild --flake .#nixos-vm switch
{
  description = "flake for nixos-vm";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      nixos-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
