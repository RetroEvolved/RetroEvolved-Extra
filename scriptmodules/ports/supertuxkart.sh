#!/usr/bin/env bash
 
# This file is part of The RetroEvolved Project
# 
# The RetroEvolved project is a reworking of the RetroPie Project which is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroEvolved/RetroEvolved-Setup/master/LICENSE.md
#
 
rp_module_id="supertuxkart"
rp_module_desc="SuperTuxKart"
rp_module_licence="GPL3 https://sourceforge.net/p/supertuxkart/code/HEAD/tree/main/trunk/COPYING?format=raw"
rp_module_section="exp"
rp_module_flags="!mali !x86"
 
function depends_supertuxkart() {
    getDepends cmake xorg xserver-xorg-legacy
}

function sources_supertuxkart() {
    if [ ! -f "/opt/retroevolved/supplementary/glshim/libGL.so.1" ]; then
        gitPullOrClone "$md_build/glshim" https://github.com/ptitseb/glshim.git
    fi
}
 
function build_supertuxkart() {
    if [ ! -f "/opt/retroevolved/supplementary/glshim/libGL.so.1" ]; then
        cd "$md_build/glshim"
        cmake . -DBCMHOST=1
        make GL
    fi
}

function install_bin_supertuxkart() {
    aptInstall supertuxkart
    if [ ! -f "/opt/retroevolved/supplementary/glshim/libGL.so.1" ]; then
       mkdir -p /opt/retroevolved/supplementary/glshim/
       cp "$md_build/glshim/lib/libGL.so.1" /opt/retroevolved/supplementary/glshim/
    fi
}
 
function configure_supertuxkart() {
    mkdir "ports"
    moveConfigDir "$home/.config/supertuxkart" "$md_conf_root/$md_id"
    addPort "$md_id" "supertuxkart" "SuperTuxKart" "LD_LIBRARY_PATH=/opt/retroevolved/supplementary/glshim LIBGL_FB=1 xinit supertuxkart"
}
