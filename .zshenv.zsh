#shellcheck shell=bash
#==============================================================================#
#           FIL:  ~/.zshenv                                                    #
#                                                                              #
#   BESKRIVNING:  Profil-fil med variabler för MAKROLIT under EndeavourOS.     #
#                                                                              #
#       SKAPARE:  Albin A. Henriksson                                          #
#       VERSION:  2024-10-15                                                   #
#==============================================================================#

# Path - den kejserliga sökvägen
typeset -U PATH path
path=("/home/albin/bin" "/home/albin/.local/bin" "/home/albin/go/bin" "/home/albin/.cargo/bin" "/opt/resolve/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/usr/lib/jvm/default/bin" "/usr/bin/site_perl:/usr/bin/vendor_perl" "/usr/bin/core_perl" "$path[@]")
export PATH

# Manualer
#export MANPATH="/usr/local/man:$MANPATH"

## Konfigurationsmapp
export XDG_CONFIG_HOME="/home/albin/.config"

## Kanske onödigt - men "peppar, peppar".
#export ZDOTDIR=$HOME

# Golang-binärer.
export GOPATH="/home/albin/go"
export GOBIN="/home/albin/go/bin"

## Textredigeraren Micro.
export MICRO_TRUECOLOR=1

## Ingen telemetri till Microsoft.
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Kontrollera utseende på QT-appar.
#export QT_QPA_PLATFORMTHEME=qt6ct
#export QT_FONT_DPI=96
#export QT_SCALE_FACTOR=1
#export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Rätt tema för flatpak-gtk-appar.
# (https://itsfoss.com/flatpak-app-apply-theme)
#export GTK_THEME=Adwaita-dark
#export GTK_THEME=Adwaita
#export ICON_THEME=Adwaita

# Ta bort filmrulle-effekten från tumnaglar.
#export G_RESOURCE_OVERLAYS=/org/gnome/nautilus/icons/filmholes.png=/usr/share/icons/filmholes.png

# Kör nmap utan root (https://www.maketecheasier.com/run-nmap-without-root-or-sudo/)
#export NMAP_PRIVILEGED=""

# Använd GPU för videoavkodning
#export LIBVA_DRIVER_NAME="radeonsi"
#export VDPAU_DRIVER="radeonsi"
#export GST_VAAPI_ALL_DRIVERS=1 # GStreamer uses a whitelist of VA-API drivers.

# Rust
#. "$HOME/.cargo/env"

# Eldräven
#export MOZ_ENABLE_WAYLAND=1
#export MOZ_DRM_DEVICE=/dev/dri/card1
#export EGL_PLATFORM="wayland"

# För att phantomjs ska fungera
export OPENSSL_CONF=/etc/ssl/

## AMD RX 580.
#export ROC_ENABLE_PRE_VEGA=1
#export HSA_OVERRIDE_GFX_VERSION=8.0.3
#export HCC_AMDGPU_TARGET=gfx803
#export OCL_ICD_VENDORS=/etc/OpenCL/vendors/amdocl64.icd
