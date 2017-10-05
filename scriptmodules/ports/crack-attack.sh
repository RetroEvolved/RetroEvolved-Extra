#!/usr/bin/env bash
 
# This file is part of The RetroEvolved Project
# 
# The RetroEvolved project is a reworking of the RetroPie Project which is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroEvolved/RetroEvolved-Setup/master/LICENSE.md
#
 
rp_module_id="crack-attack"
rp_module_desc="Crack-Attack - Tetris Attack clone"
rp_module_licence="GPL2 http://cvs.savannah.nongnu.org/viewvc/*checkout*/crack-attack/crack-attack/COPYING?revision=1.2"
rp_module_help="Because this uses X, you may find that you are unable to control the game and the game appears in a small window in the top left. Use the Runcommand option to set the resolution to CEA-4 or similarly smaller sizes. This will allow you to control the game as the window will have focus and also fill up more of the screen. If you just get a black screen or you return to EmulationStation, please run dpkg-reconfigure xserver-xorg-legacy as root and set it so Anybody can use X. See the troubleshooting section of the RetroEvolved-Extras readme for more info. There is still an issue with a console window being visible that needs to be fixed."
rp_module_section="exp"
rp_module_flags="!mali !x86"
 
function depends_crack-attack() {
    getDepends cmake xorg xserver-xorg-legacy
}

function sources_crack-attack() {
    if [ ! -f "/opt/retroevolved/supplementary/glshim/libGL.so.1" ]; then
        gitPullOrClone "$md_build/glshim" https://github.com/ptitseb/glshim.git
    fi
}
 
function build_crack-attack() {
    if [ ! -f "/opt/retroevolved/supplementary/glshim/libGL.so.1" ]; then
        cd "$md_build/glshim"
        cmake . -DBCMHOST=1
        make GL
    fi
}

function install_bin_crack-attack() {
    aptInstall crack-attack
    if [ ! -f "/opt/retroevolved/supplementary/glshim/libGL.so.1" ]; then
       mkdir -p /opt/retroevolved/supplementary/glshim/
       cp "$md_build/glshim/lib/libGL.so.1" /opt/retroevolved/supplementary/glshim/
    fi
}
 
function configure_crack-attack() {
    mkdir "ports"
    moveConfigDir "$home/.crack-attack" "$md_conf_root/crack-attack"
    addPort "$md_id" "crack-attack" "Crack-Attack - Tetris Attack clone" "LD_LIBRARY_PATH=/opt/retroevolved/supplementary/glshim LIBGL_FB=1 xinit crack-attack"
}
