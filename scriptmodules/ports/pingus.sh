#!/usr/bin/env bash

# This file is part of The RetroEvolved Project
# 
# The RetroEvolved project is a reworking of the RetroPie Project which is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroEvolved/RetroEvolved-Setup/master/LICENSE.md
#

rp_module_id="pingus"
rp_module_desc="Pingus - Open source Lemmings clone"
rp_module_licence="GPL3 https://raw.githubusercontent.com/Pingus/pingus/master/COPYING"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function install_bin_pingus() {
    aptInstall pingus pingus-data
}

function configure_pingus() {
    mkRomDir "ports"

    moveConfigDir "$home/.pingus" "$md_conf_root/$md_id"
    addPort "$md_id" "pingus" "Pingus" "pingus"
}
