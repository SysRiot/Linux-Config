#!/bin/bash
#
# Script de configuración y optimización para Ubuntu
# Autor: SysRiot 
# Descripción: Automatiza la actualización, instalación de herramientas y optimización del sistema.
# Repositorio: https://github.com/SysRiot/Linux-Config
# V-1.1

set -e  # Detiene la ejecución si ocurre un error

# Definir el archivo de log
LOGFILE="/var/log/sysriot_setup.log"
sudo touch "$LOGFILE"
sudo chmod 666 "$LOGFILE"

# Redirigir la salida estándar y de errores al archivo de log
exec > >(tee -a "$LOGFILE") 2>&1  

### FUNCIONES ###
actualizar_sistema() {
    echo "Actualizando el sistema..."
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
}

instalar_paquetes() {
    echo "Instalando herramientas esenciales..."
    sudo apt install -y curl wget git vim htop net-tools unzip zip \
        build-essential software-properties-common gnome-tweaks \
        gnome-shell-extensions neofetch preload ufw timeshift
}

instalar_multimedia() {
    echo "Instalando codecs de audio y video..."
    sudo apt install -y ubuntu-restricted-extras ffmpeg vlc
}

instalar_flatpak_snap() {
    echo "Instalando soporte para Flatpak y Snap..."
    sudo apt install -y flatpak gnome-software-plugin-flatpak
    sudo snap install snap-store
}

configurar_gnome() {
    echo "Ajustando configuración de GNOME..."
    USERNAME=${SUDO_USER:-$USER}
    sudo -u "$USERNAME" gsettings set org.gnome.desktop.interface enable-animations false
    sudo -u "$USERNAME" gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
    sudo -u "$USERNAME" gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
}

optimizar_memoria() {
    echo "Liberando caché de memoria..."
    sync && echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null
}

configurar_firewall() {
    echo "Configurando firewall (UFW)..."
    sudo ufw enable
    sudo ufw allow OpenSSH
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
}

# ----- ACTIVAR SI TIENES UN SSD -----
#activar_trim_ssd() {
#    echo "Activando TRIM para SSD..."
#    sudo systemctl enable fstrim.timer
#}

corregir_errores_comunes() {
    echo "Corrigiendo errores comunes..."
    sudo dpkg --configure -a
    sudo apt install -f -y
}

limpiar_sistema() {
    echo "Limpiando el sistema..."
    sudo apt autoremove -y && sudo apt autoclean -y
}

# ---- DRIVERS NVIDIA ---- #
#instalar_nvidia() {
    #echo "Instalando drivers de NVIDIA..."
    #sudo add-apt-repository ppa:graphics-drivers/ppa -y
    #sudo apt update
    
    # Tarjetas NVIDIA antiguas (Series 400/500/600)
    # sudo apt install -y nvidia-390
    
    # Tarjetas NVIDIA modernas (Series 700/900/1000)
    # sudo apt install -y nvidia-470
    
    # Tarjetas NVIDIA más recientes (Series 2000/3000/4000)
    # sudo apt install -y nvidia-driver-535

    # Instalación automática (puede instalar uno incorrecto, usar con precaución)
    # sudo ubuntu-drivers autoinstall
#}

# ---- PULSEAUDIO ---- #
instalar_pulseaudio() {
    echo "Instalando PulseAudio..."
    sudo apt install -y pulseaudio pavucontrol
}

# ---- HERRAMIENTAS DE DESARROLLO ---- #
instalar_herramientas_desarrollo() {
    echo "Instalando herramientas de desarrollo..."
    sudo apt install -y python3 python3-pip nodejs npm docker.io docker-compose
}

# --- Si la PC tiene poca RAM, habilitar ZRAM puede mejorar el rendimiento. ---
#habilitar_zram() {
#    echo "Habilitando ZRAM para mejorar el rendimiento..."
#    sudo apt install -y zram-tools
#    echo "zram" | sudo tee -a /etc/modules
#    echo "options zram num_devices=1" | sudo tee -a /etc/modprobe.d/zram.conf
#    echo "KERNEL==\"zram0\", ATTR{comp_algorithm}=\"lz4\", ATTR{disksize}=\"2G\", RUN=\"/sbin/mkswap /dev/zram0\", RUN+=\"/sbin/swapon /dev/zram0 -p 5\"" | sudo tee /etc/udev/rules.d/99-zram.rules
#}

# --- Para juegos, puede instalar Steam y Proton. ---
#instalar_gaming() {
#    echo "Instalando herramientas para gaming..."
#    sudo apt install -y steam lutris
#}


### EJECUCIÓN DEL SCRIPT ###
actualizar_sistema
instalar_paquetes
instalar_multimedia
instalar_flatpak_snap
configurar_gnome
optimizar_memoria
configurar_firewall
corregir_errores_comunes
#activar_trim_ssd  # Activarlo manualmente
#instalar_nvidia # Activarlo manualmente
#habilitar_zram # Activarlo manualmente
#instalar_gaming # Activarlo manualmente
instalar_pulseaudio
instalar_herramientas_desarrollo
limpiar_sistema

echo "--------------------------------------------"
echo "✅ Configuración terminada con éxito"
echo "💻 Reinicia el sistema para aplicar los cambios"
echo "🔥 Script creado por -> SysRiot"
echo "📂 Repositorio: https://github.com/SysRiot/Linux-Config"
echo "📜 Log guardado en: $LOGFILE"
echo "--------------------------------------------"
