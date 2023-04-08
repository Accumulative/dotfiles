#!/bin/sh

sudo pacman -S - <~/.dotfiles/pkglist.txt

cd ~/Downloads || exit

tar_from_url() {
	URL="$1"
	curl -O "$URL"
	tar -xvf "${URL##*/}"
	rm "${URL##*/}"
}

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo systemctl enable --now bluetooth

### JIRA CLI
tar_from_url https://github.com/ankitpokhrel/jira-cli/releases/download/v1.3.0/jira_1.3.0_linux_x86_64.tar.gz
cp jira_1.3.0_linux_x86_64/bin/jira /usr/local/bin/jira
rm -rf jira_1.3.0_linux_x86_64
###

### keepass
wget https://github.com/kee-org/keepassrpc/releases/download/v1.14.0/KeePassRPC.plgx
sudo mv ~/Downloads/KeePassRPC.plgx /usr/share/keepass/Plugins

## gcloud
tar_from_url https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-425.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
sudo cp ./google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud
sudo cp ./google-cloud-sdk/bin/gsutil /usr/local/bin/gsutil
rm -rf ./google-cloud-sdk

# mullvad vpn
pikaur -S mullvad-vpn

sudo systemctl enable --now docker
