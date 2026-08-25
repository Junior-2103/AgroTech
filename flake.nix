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
          pkgs.android-tools
        ];
        shellHook = ''
          export JAVA_HOME="${pkgs.jdk17}"
          export ANDROID_HOME="$HOME/Android/Sdk"
          export ANDROID_SDK_ROOT="$ANDROID_HOME"
          export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
        '';
      };
      
    };
  };
}
