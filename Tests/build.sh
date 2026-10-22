#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
fpc -Mdelphi -Fu. -Fu../Source -Fu../Source/AvailableTypes -Fu../Source/Events \
  -Fu../Source/Helpers -Fu../Source/Net -Fu../Source/Parser \
  -Fu../Source/Compat/FPC -Fu/usr/lib/x86_64-linux-gnu/fpc/3.2.2/units/x86_64-linux/fcl-web TestRunner.lpr
