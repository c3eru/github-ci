#!/usr/bin/env bash
# Copyright (C) 2020 Muhammad Fadlyas (fadlyas07)
# SPDX-License-Identifier: GPL-3.0-or-later

export ARCH=arm64
export SUBARCH=$ARCH
export telegram_channel_id=$1
export telegram_bot_token=$2
export telegram_personal_id=$3
export KBUILD_BUILD_USER=greenforce-tesd
export KBUILD_BUILD_HOST=weekly-build
branch=$(git rev-parse --abbrev-ref HEAD)

info()
{
    kernel_version=$(cat $(pwd)/out/.config | grep Linux/arm64 | cut -d " " -f3)
    uts_version=$(cat $(pwd)/out/include/generated/compile.h | grep UTS_VERSION | cut -d '"' -f2)
    toolchain_version=$(cat $(pwd)/out/include/generated/compile.h | grep LINUX_COMPILER | cut -d '"' -f2)
    trigger_sha="$(git rev-parse HEAD)"
    latest_commit="$(git log --pretty=format:'%s' -1)"
    commit_by=$(git log --pretty=format:'by %an' -1)
}
