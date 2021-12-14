#!/usr/bin/env bash
# Copyright (C) 2020 Muhammad Fadlyas (fadlyas07)
# SPDX-License-Identifier: GPL-3.0-or-later

export ARCH=arm64
export SUBARCH=$ARCH
export KBUILD_BUILD_USER=greenforce-tesd
export KBUILD_BUILD_HOST=weekly-build
branch="$(git rev-parse --abbrev-ref HEAD)"

info()
{
    kernel_version=$(cat $(pwd)/out/.config | grep Linux/arm64 | cut -d " " -f3)
    uts_version=$(cat $(pwd)/out/include/generated/compile.h | grep UTS_VERSION | cut -d '"' -f2)
    toolchain_version=$(cat $(pwd)/out/include/generated/compile.h | grep LINUX_COMPILER | cut -d '"' -f2)
    trigger_sha="$(git rev-parse HEAD)"
    latest_commit="$(git log --pretty=format:'%s' -1)"
    commit_by="$(git log --pretty=format:'by %an' -1)"
    commit_template="$(echo ${trigger_sha} | cut -c 1-8) (\"<a href='https://github.com/greenforce-project/kernel_xiaomi_citrus_sm6115p/commit/${trigger_sha}'>${latest_commit}</a>\")"
    caption_template="
    👤 Owner: yeetnosense & zech4
    🌿 Branch: $branch
    🏚️ Linux version: $kernel_version
    💡 Compiler: $toolchain_version
    🎁 Top commit: $latest_commit
    👩‍💻 Commit author: $commit_by
    🐧 UTS version: $uts_version
    Build took $build_diff_msg."
}
