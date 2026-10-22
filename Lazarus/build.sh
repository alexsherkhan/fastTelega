#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
fpc -Mdelphi -Fu../Source -Fu../Source/AvailableTypes -Fu../Source/Events \
  -Fu../Source/Helpers -Fu../Source/Net -Fu../Source/Parser \
  -Fu../Source/Compat/FPC EchoBot.lpr
