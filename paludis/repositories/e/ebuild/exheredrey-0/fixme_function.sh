#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
library used to define functions that needs implementation

This file is used for sourcing'

econf() { die fixme "econf is not implemented which is expected to be used to export our file hierarchy in '\${DEFAULT_SRC_CONFIGURE_PARAMS}' which are then parsed in 'configure'" ;}

expatch() { die fixme "expatch is not implemented which is used for patching" ;}

require() { die fixme "require is not implemented which is used for sourcing" ;}
