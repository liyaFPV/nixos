rm -rf flake.lock
nix build .#nixosConfigurations.laptop.config.system.build.toplevel
nix build .#nixosConfigurations.pc.config.system.build.toplevel
nix build .#nixosConfigurations.vm.config.system.build.toplevel
nix flake show .