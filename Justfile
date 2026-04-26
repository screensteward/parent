# ScreenSteward Parent (Linux) — dev targets.

default:
    @just --list

# Flutter analyze + tests (via fvm, cf. .fvmrc).
check:
    fvm flutter analyze
    fvm flutter test

# Build release (via fvm, cf. .fvmrc).
build:
    fvm flutter build linux --release

# Local dogfood install (requires sudo).
install: build
    sudo install -d /usr/local/lib/screensteward-parent
    sudo rsync -a --delete build/linux/x64/release/bundle/ /usr/local/lib/screensteward-parent/
    sudo install -Dm644 packaging/desktop/screensteward-parent.desktop /usr/share/applications/screensteward-parent.desktop
    sudo install -Dm644 packaging/desktop/screensteward-parent.png /usr/share/icons/hicolor/512x512/apps/screensteward-parent.png
    -sudo update-desktop-database /usr/share/applications 2>/dev/null || true

# Uninstall.
uninstall:
    sudo rm -rf /usr/local/lib/screensteward-parent
    sudo rm -f /usr/share/applications/screensteward-parent.desktop
    sudo rm -f /usr/share/icons/hicolor/512x512/apps/screensteward-parent.png
    -sudo update-desktop-database /usr/share/applications 2>/dev/null || true

# Reinstall.
reinstall: uninstall install
