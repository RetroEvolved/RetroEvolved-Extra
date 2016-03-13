#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rawgl"
rp_module_desc="rawgl - Another World Engine"
rp_module_menus="4+"
rp_module_flags="!mali !x86"

function depends_rawgl() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev
}

function sources_rawgl() {
    gitPullOrClone "$md_build" https://github.com/vanfanel/rawgl.git
}

function build_rawgl() {
    make
}

function install_rawgl() {
    md_ret_files=('rawgl')
}

function configure_rawgl() {
    mkRomDir "ports"
    mkRomDir "ports/$md_id"

    addPort "$md_id" "rawgl" "rawgl - Another World Engine" "$md_inst/rawgl --datapath=$romdir/ports/$md_id --render=original --aspect=true --full=true"
    __INFMSGS+=("Please copy your Another World data files to $romdir/ports/$md_id before running the game.")
}