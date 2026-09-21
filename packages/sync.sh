#!/usr/bin/env bash
# Package lists for rebuilding a machine.
#
#   ./packages/sync.sh dump      refresh the lists from this machine
#   ./packages/sync.sh install   install everything the lists name
#
# Not handled here (see README): rambox (flatpak from a now-disabled remote).
set -euo pipefail
cd "$(dirname "$0")"

dump() {
  pacman -Qqen > pacman.txt
  pacman -Qqem > aur.txt
  flatpak list --app --columns=origin,application | grep -v '^app-origin' > flatpak.txt
  # ponytail: snap marks bases in Notes but not content/runtime snaps, so those
  # are filtered by name. If a real app ever matches this grep, drop it here.
  snap list | awk 'NR>1 && $NF!="base" && $NF!="snapd" {
      line = $1
      ch = $4; sub(/^latest\//, "", ch)
      if (ch != "stable")   line = line " --channel=" ch
      if ($NF == "devmode") line = line " --devmode"
      if ($NF == "classic") line = line " --classic"
      print line
    }' | grep -vE '^(gnome-|gtk-common-themes|mesa-|wine-platform-)' > snap.txt
  wc -l ./*.txt
}

install() {
  xargs -r sudo pacman -S --needed --noconfirm < pacman.txt
  xargs -r yay    -S --needed --noconfirm < aur.txt
  xargs -r -L1 flatpak install -y         < flatpak.txt
  xargs -r -L1 sudo snap install          < snap.txt
}

case "${1:-}" in
  dump|install) "$1" ;;
  *) echo "usage: $0 {dump|install}" >&2; exit 2 ;;
esac
