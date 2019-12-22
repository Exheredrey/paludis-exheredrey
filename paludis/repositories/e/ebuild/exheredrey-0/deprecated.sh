#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
Backend used for deprecated commands
'

einstall() { die deprecated einstall fixme ;}
nonfatal() { die deprecated nonfatal 'die 0?' ;}

# What is the difference in nonfatal and is_nonfatal?
is_nonfatal() { die deprecated is_fatalfatal 'die?' ;}
