#!/bin/bash

DIR=$(dirname "$(readlink -f $0 || realpath $0)")

cd "${HOME}/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg"
ln -sf "${DIR}/01-autoexec.cfg" autoexec.cfg

if [ ! -d my ]; then
    ln -sf "${DIR}" my
fi

cd ../resource/
cp "${DIR}/csgo_coloredchatmessages.txt" .

threads=$(cat /proc/cpuinfo | grep GHz | wc -l)

echo
echo "Installed !"
echo
echo "Please set up your launch options:"
echo -e "\t-novid -high -threads ${threads} -tickrate 128 -nojoy -language coloredchatmessages -console -exec autoexec"
echo

