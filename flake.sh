cp hardware-configuration.nix ./nixos/laptop/
cp hardware-configuration.nix ./nixos/pc/
cp hardware-configuration.nix ./nixos/vm/

rm -rf flake.lock
nix build .#nixosConfigurations.laptop.config.system.build.toplevel
nix build .#nixosConfigurations.pc.config.system.build.toplevel
nix build .#nixosConfigurations.vm.config.system.build.toplevel
nix flake show .

rm ./nixos/laptop/hardware-configuration.nix
rm ./nixos/pc/hardware-configuration.nix
rm ./nixos/vm/hardware-configuration.nix