# System  Config Flakes
## MacOS
### Install

1. Install Xcode Command Line Tools:

   ```bash
   xcode-select --install
   ```

1. Install Nix using the [official installer](https://nixos.org/download.html#nix-install-macos):

   ```bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
   ```

1. Enable Flake support:

   ```bash
   echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf  # or ~/.config/nix/nix.conf
   ```

1. Install [`nix-darwin`](https://github.com/LnL7/nix-darwin):

   ```bash
   nix run nix-darwin -- switch --flake .#macbook
   ```

1. Apply changes to your system:

   ```bash
   darwin-rebuild switch --flake .#macbook
   ```

## DevShells

1. initialize a flake from `github.com/laermannjan/flake-templates`

For example: 
```bash
nix flake new -t github.com:laermannjan/flake-templates#python-pipenv
```

## 1Password
The flakes will install 1Password and the 1Password-cli. SSH-keys and other credentials (e.g. AWS Access Tokens, see direnv config) are loaded via the `op` cli.
Remember to install repsective plugins (couldn't figure out a way to do this via nix, yet)
```bash
op plugin init aws
op plugin init glab
op plugin init gh
```


## TODOs
- macos options
- outsource dotfiles, atleast neovim config into separate repo?
- tmux config
- use nix to supply lsps, etc instead of mason
