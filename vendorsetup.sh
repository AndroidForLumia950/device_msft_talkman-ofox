#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2022 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="talkman"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true
	
	export TARGET_ARCH=arm64
	export FOX_AB_DEVICE=0
	export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=0
	export FOX_REPLACE_TOOLBOX_GETPROP=0
	export OF_USE_LZMA_COMPRESSION=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_BASH_SHELL=0
	export FOX_ASH_IS_BASH=0
	export FOX_REMOVE_BASH=0
	export OF_USE_MAGISKBOOT=1
	export OF_DONT_PATCH_ON_FRESH_INSTALLATION=0
	export OF_KEEP_FORCED_ENCRYPTION=0
	export OF_FORCE_DISABLE_DM_VERITY=1
	export OF_FORCE_DISABLE_FORCED_ENCRYPTION=1
	export OF_SKIP_FBE_DECRYPTION=1
	export OF_FLASHLIGHT_ENABLE=0
	export OF_MAINTAINER=Noteclyps3
	export OF_HIDE_NOTCH=0
	export OF_CLOCK_POS=0
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_USE_LOCKSCREEN_BUTTON=1
	export FOX_INSTALLER_DEBUG_MODE=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_LOCAL_CALLBACK_SCRIPT='cp -r /home/eclypse/fox_12.1/device/msft/talkman/rootdir/default.prop'
fi
