#!/usr/bin/env bash
# Copyright (C) 2020 Muhammad Fadlyas (fadlyas07)
# SPDX-License-Identifier: GPL-3.0-or-later

export ARCH=arm64
export SUBARCH=$ARCH
export KBUILD_BUILD_USER=test
export KBUILD_BUILD_HOST=miui
branch="$(git rev-parse --abbrev-ref HEAD)"

info()
{
    kernel_version=$(cat $(pwd)/out/.config | grep Linux/arm64 | cut -d " " -f3)
    uts_version=$(cat $(pwd)/out/include/generated/compile.h | grep UTS_VERSION | cut -d '"' -f2)
    toolchain_version=$(cat $(pwd)/out/include/generated/compile.h | grep LINUX_COMPILER | cut -d '"' -f2)
    trigger_sha="$(git rev-parse HEAD)"
    latest_commit="$(git log --pretty=format:'%s' -1)"
    commit_by="$(git log --pretty=format:'by %an' -1)"
    caption_template="
    👤 Owner: mobx
    🌿 Branch: $branch
    🏚️ Linux version: $kernel_version
    💡 Compiler: $toolchain_version
    🎁 Top commit: $latest_commit
    👩‍💻 Commit author: $commit_by
    🐧 UTS version: $uts_version
    Build took $build_diff_msg."
}
