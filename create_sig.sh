#!/usr/bin/env bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_sig.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Lanhild <archlan@protonmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/13 10:18:47 by Lanhild           #+#    #+#              #
#    Updated: 2022/01/13 10:18:47 by Lanhild          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## Generate sha256sum and gpg signature files
PWD=`pwd`
DIR="$PWD/out"

if [[ ! -d "$DIR" ]]; then
	mkdir -p "$DIR"
fi

RELEASE=`find $DIR -type f -name "archlan-*.iso" -printf "%f\n"`

if [[ -n "$RELEASE" ]]; then
	echo -e "\n[*] Generating sha256sum for ${RELEASE} ..."
	cd "$DIR" && sha256sum ${RELEASE} > ${RELEASE}.sha256sum
	if [[ -e "${RELEASE}.sha256sum" ]]; then
		echo -e "[*] Checksum generated successfully."
	else
		echo -e "[!] Failed to generate checksum file."
	fi

	echo -e "\n[*] Generating gpg signature for ${RELEASE} ..."
	gpg --default-key archlan@protonmail.com --output ${RELEASE}.sig --detach-sig ${RELEASE}
	if [[ -e "${RELEASE}.sig" ]]; then
		echo -e "[*] Signature generated successfully.\n"
	else
		echo -e "[!] Failed to generate signature file.\n"
	fi
else
	echo -e "\n[!] There's no ISO file in the 'out' directory.\n[!] Copy the ISO file in 'out' directory & Run this script again.\n"
	exit 1
fi