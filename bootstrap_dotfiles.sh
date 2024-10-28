#!/bin/sh
set -eux

dotfiles="${HOME}/s/dotfiles"
ln -sf "${dotfiles}/bin" "${HOME}/bin"

common_config_prefix="${dotfiles}/common_config"
host_specific_prefix="${dotfiles}/host_specific/$(hostname)/config"

ln -sf "${host_specific_prefix}/profile" "${HOME}/.profile"

mkdir -p "${HOME}/.config"
cd "${common_config_prefix}"
for f in *; do
	if test -e "${host_specific_prefix}/${f}" ; then
		ln -sf "${host_specific_prefix}/${f}" "${HOME}/.config/${f}"
	else
		ln -sf "${common_config_prefix}/${f}" "${HOME}/.config/${f}"
	fi
done
