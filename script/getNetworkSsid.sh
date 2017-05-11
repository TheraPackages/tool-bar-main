#===============================================
# Copyright (C) 2017 All rights reserved.
#===============================================
# Filename:   Get Networ Ssid.sh
# Author:     scucheri
# Date:       2017-05-11
# Description:
# 获取本机的网络ssid
#===============================================
#!/bin/bash



endPortNumber=65535
starPortNumber=7000

/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {echo substr($0, index($0, $2))}'
