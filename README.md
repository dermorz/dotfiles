# Dotfiles

_Powered by [chezmoi](https://www.chezmoi.io/)_

The source directory lives at `~/code/dotfiles` (set via `sourceDir` in
`dot_config/chezmoi/chezmoi.toml.tmpl`), not at chezmoi's default location.

## Restoring a machine

```bash
git clone git@github.com:dermorz/dotfiles.git ~/code/dotfiles
chezmoi init --source=~/code/dotfiles
chezmoi apply
```

The `--source` flag is required on the first run: chezmoi cannot read
`sourceDir` from a config file that does not exist yet.

Then the packages:

```bash
~/code/dotfiles/packages/sync.sh install
```

## Packages

`packages/` holds one list per source, refreshed with `packages/sync.sh dump`:

| File | Source | Count |
| ---- | ------ | ----- |
| `pacman.txt`  | official repos (`pacman -Qqen`) | 321 |
| `aur.txt`     | AUR (`pacman -Qqem`, installed via `yay`) | 13 |
| `flatpak.txt` | flathub, as `remote application` pairs | 2 |
| `snap.txt`    | snap, with channel/confinement flags | 3 |

Base and runtime snaps (`core*`, `gnome-*`, `mesa-*`, `wine-platform-*`) are
left out — snap pulls them in as dependencies.

### Not automated

- **rambox** — installed from a now-disabled flatpak remote (`app-origin`),
  so it cannot be reinstalled from a list. Fetch it from the project page.
- **fusion360** — installs in `devmode` from the beta channel; `sync.sh`
  passes those flags, but the snap itself is community-maintained and may
  need attention after install.

## Machine-specific settings

These are deliberately **not** in this repo:

- `~/.gitconfig.d/` — git identity, work overrides, tool IDs. Pulled in by
  `[include]` directives in `.gitconfig`.
- `~/.config/aerc/accounts.conf` — mail credentials.
- `~/.config/nvim/.env` — API keys.

They are listed in `.chezmoiignore`, so `chezmoi add` will not pick them up
by accident. Recreate them by hand on a new machine.
