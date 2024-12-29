{
  description = "Minimal PSX Development Environment";

  # TODO: add my super awesome Nix build of PCSX-Redux

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, pcsx-redux }:
    let
      pkgs = import nixpkgs {
        localSystem = { system = builtins.currentSystem; };
      };
      crossPkgs = import nixpkgs {
        localSystem = { system = builtins.currentSystem; };
        crossSystem = { system = "mipsel-none-elf"; };
      };
    in
      {
        devShells.x86_64-linux.default = pkgs.mkShell {
          packages = [
            crossPkgs.buildPackages.gcc-unwrapped
            crossPkgs.buildPackages.binutils-unwrapped
          ];
        };
      };
}
