#!/usr/bin/env bash

# This file is part of The RetroEvolved Project
# 
# The RetroEvolved project is a reworking of the RetroPie Project which is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroEvolved/RetroEvolved-Setup/master/LICENSE.md
#

rp_module_id="gamemaker"
rp_module_desc="GameMaker - Games for the Raspberry Pi"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_gamemaker() {
    getDepends libopenal-dev
}

function install_bin_gamemaker() {
    # Install They Need To Be Fed Game
    wget -O- -q https://www.yoyogames.com/download/pi/tntbf | tar -xvz -C "$md_inst"
    # Install Super Crate Box Game
    wget -O- -q https://www.yoyogames.com/download/pi/crate | tar -xvz -C "$md_inst"
    # Install Maldita Castilla Game
    wget -O- -q https://www.yoyogames.com/download/pi/castilla | tar -xvz -C "$md_inst"
}

function configure_gamemaker() {
    mkRomDir "ports"

    addPort "$md_id" "TheyNeedToBeFed" "TheyNeedToBeFed" "$md_inst/TheyNeedToBeFed/TheyNeedToBeFed"
    addPort "$md_id" "SuperCrateBox" "SuperCrateBox" "$md_inst/SuperCrateBox/SuperCrateBox"
    addPort "$md_id" "MalditaCastilla" "MalditaCastilla" "$md_inst/MalditaCastilla/MalditaCastilla"
}
