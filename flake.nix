{
  description = "AgroTech Flutter";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux.default = let
        pkgs = import nixpkgs { 
          system = "x86_64-linux";
        };
      in
      pkgs.mkShell {
        packages = [
          pkgs.flutter
          pkgs.jdk17
        ];
      };
    };
  };
}
