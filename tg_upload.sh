#!/usr/bin/env bash
# Copyright (C) 2020 Muhammad Fadlyas (fadlyas07)
# SPDX-License-Identifier: GPL-3.0-or-later

# Function kanged from laststandrighthere's scripts
tg()
{
    ACTION=$1
    EXTRA=$2
    CHANNEL_ID=$3
    CAPTION=$4
    URL="https://api.telegram.org/bot${telegram_bot_token}"

    case "$ACTION" in
        msg)
            curl \
            -d chat_id=$CHANNEL_ID \
            -d parse_mode=HTML \
            -d disable_web_page_preview=true \
            -X POST ${URL}/sendMessage \
            -d text="$EXTRA"
            ;;
        file)
            curl \
            -F chat_id=$CHANNEL_ID \
            -F parse_mode=HTML \
            -F disable_web_page_preview=true \
            -F document=@$EXTRA ${URL}/sendDocument \
            -F caption="$CAPTION"
            ;;
    esac
}

notif()
{
    echo -e "\e[1;32m$*\e[0m"
}

err()
{
    echo -e "\e[1;41m$*\e[0m"
}
