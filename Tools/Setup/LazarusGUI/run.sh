#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
unset GTK_EXE_PREFIX GTK_MODULES GTK_PATH GDK_PIXBUF_MODULE_FILE \
  GDK_PIXBUF_MODULEDIR GSETTINGS_SCHEMA_DIR SNAP SNAP_REVISION SNAP_EUID \
  SNAP_CONTEXT SNAP_USER_COMMON SNAP_USER_DATA SNAP_APP_COMMON_ID \
  SNAP_INSTANCE_NAME SNAP_LAUNCHER_ARCH_TRIPLET SNAP_ARCH SNAP_VERSION \
  SNAP_COMMON SNAP_UID 2>/dev/null || true
BIN=$(find lib -maxdepth 2 -type f -name FastTelegaSetupGui | head -n 1)
if [ -z "$BIN" ]; then
  echo "Binary not found. Run ./build.sh first." >&2
  exit 1
fi
exec "$BIN" "$@"
