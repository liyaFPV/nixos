{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
    mkHost = { system, path }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          path
        ];
      };
  in
  {
    nixosConfigurations = {
      laptop = mkHost {
        system = "x86_64-linux";
        path = ./host/Laptop/configuration.nix;
      };

      pc = mkHost {
        system = "x86_64-linux";
        path = ./host/PC/configuration.nix;
      };

      vm = mkHost {
        system = "x86_64-linux";
        path = ./host/VM/configuration.nix;
      };
    };
  };
}
