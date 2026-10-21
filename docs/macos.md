# Mac setup

Apple Silicon, user `gmelika`. Native desktop with shared tools, dotfiles, and themes.

## Install

Install command line tools (`xcode-select --install`),
[Nix or Lix](https://github.com/nix-darwin/nix-darwin#prerequisites) with flakes,
and [Homebrew](https://brew.sh/). nix-darwin manages the Nix installation.

Run from a terminal on the Mac:

```sh
git clone https://github.com/IcyGeorge/nixos-config.git
cd nixos-config
nix build .#darwinConfigurations.mac.system --out-link result-mac
sudo ./result-mac/sw/bin/darwin-rebuild switch --flake .#mac
```

Log out/in, open Karabiner, and grant requested permissions. Caps Lock becomes
Ctrl when held and Escape when tapped. Back up conflicting dotfiles if Hjem reports them.

Add U.S. and Arabic – PC in Keyboard settings; disable Caps Lock language switching.

## Rebuild

```sh
sudo darwin-rebuild switch --flake .#mac
sudo darwin-rebuild switch --rollback
nix flake update nixpkgs-darwin nix-darwin
```

Rollback covers Nix-managed configuration and packages.

## Doom

Install Doom once (configuration is already managed):

```sh
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
launchctl kickstart -k gui/$(id -u)/org.nixos.emacs
```

After configuration changes, run `doom sync` and restart the daemon.

## Android

In Android Studio, use SDK `/Users/gmelika/Library/Android/sdk`, install required
SDK components, and create an ARM64 emulator. Set Gradle JDK to the path printed
by `echo "$JAVA_HOME"`, especially when launching Studio from Finder.
