curl https://raw.githubusercontent.com/Verantor/NixDrop/refs/heads/main/disko.nix -o /tmp/disko-config.nix
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix
sudo nixos-generate-config --no-filesystems --root /mnt
sleep 5s
cd /mnt/etc/nixos/
git clone https://github.com/Verantor/NixDrop/
sleep 5s
cd NixDrop/
sudo nixos-install --root /mnt --flake '/mnt/etc/nixos/NixDrop#nixos'
