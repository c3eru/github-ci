#!/usr/bin/env bash
# Copyright (C) 2020 Muhammad Fadlyas (fadlyas07)
# SPDX-License-Identifier: GPL-3.0-or-later

URL="https://api.telegram.org/bot${bot}/"
file ()
{
    curl \
    -F "disable_web_page_preview=true" \
    -F "parse_mode=html" \
    -F document=@$1 $URLsendDocument \
    -F chat_id=$2
}

msg ()
{
    curl \
    -d "disable_web_page_preview=true" \
    -d "parse_mode=html" \
    -X POST $URLsendMessage \
    -d chat_id=$1 \
    -d text=$2
}

notif ()
{
    echo -e "\e[1;32m$*\e[0m"
}

err ()
{
    echo -e "\e[1;41m$*\e[0m"
}
