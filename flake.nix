{
  description = "Example Python development environment for Zero to Nix";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2405.*.tar.gz";
  };

  # Flake outputs
  outputs = { self, nixpkgs }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      # Development environment output
      devShells = forAllSystems ({ pkgs }: {
        default =
          let
            # Use Python 3.11
            python = pkgs.python311;
          in
          pkgs.mkShell {
            # The Nix packages provided in the environment
            packages = [
              python
              pkgs.poetry
            ];

            shellHook = ''
              export HISTFILE=$PWD/.nix_shell_history
              export HISTSIZE=1000
              export HISTCONTROL=ignoredups
              [ ! -f $HISTFILE ] && touch $HISTFILE
              history -r
              trap 'history -a' EXIT
              # zsh が利用可能な場合は zsh に切り替え、ない場合はデフォルトシェルを使用
              if command -v zsh >/dev/null 2>&1; then
                exec zsh -l
              elif [ -n "$SHELL" ]; then
                exec "$SHELL" -l
              fi
            '';
          };
      });
    };
}
