#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
fpc -Mdelphi fastTelegaSetup.lpr
