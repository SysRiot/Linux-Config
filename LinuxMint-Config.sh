#!/bin/bash
#
# Script de configuración y optimización para Linux Mint
# Autor: SysRiot
# Descripción: Automatiza la configuración inicial y optimización de Linux Mint con opciones personalizables.
# Repositorio: https://github.com/SysRiot/Linux-Config
# V-1.1

set -e  # Detiene la ejecución si ocurre un error

# Definir el archivo de log
LOGFILE="/var/log/sysriot_mint_setup.log"
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
    sudo apt install -y mint-meta-codecs ffmpeg vlc
}

instalar_flatpak() {
    echo "Instalando y configurando Flatpak..."
    sudo apt install -y flatpak gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

configurar_cinnamon() {
    echo "Ajustando configuración de Cinnamon..."
    gsettings set org.cinnamon.desktop.interface enable-animations false
    gsettings set org.cinnamon.desktop.wm.preferences button-layout ':minimize,maximize,close'
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

corregir_errores_comunes() {
    echo "Corrigiendo errores comunes..."
    sudo dpkg --configure -a
    sudo apt install -f -y
}

limpiar_sistema() {
    echo "Limpiando el sistema..."
    sudo apt autoremove -y && sudo apt autoclean -y
}

# ---- OPCIONES MANUALES ---- #
# Para activar, descomenta las líneas necesarias

# Instalar controladores NVIDIA
# instalar_nvidia() {
#     echo "Instalando controladores NVIDIA..."
#     sudo add-apt-repository ppa:graphics-drivers/ppa -y
#     sudo apt update
#     
#     # Tarjetas NVIDIA antiguas (Series 400/500/600)
#     # sudo apt install -y nvidia-390
#     
#     # Tarjetas NVIDIA modernas (Series 700/900/1000)
#     # sudo apt install -y nvidia-470
#     
#     # Tarjetas NVIDIA más recientes (Series 2000/3000/4000)
#     # sudo apt install -y nvidia-driver-535
#     
#     # Instalación automática (puede instalar uno incorrecto, usar con precaución)
#     sudo ubuntu-drivers autoinstall
# }

# Instalar software adicional (Steam, Lutris, Docker, VirtualBox)
# instalar_software_extra() {
#     echo "Instalando software adicional..."
#     sudo apt install -y steam lutris docker.io docker-compose virtualbox
# }

# Optimización avanzada
# activar_trim_ssd() {
#     echo "Activando TRIM para SSD..."
#     sudo systemctl enable fstrim.timer
# }

# habilitar_zram() {
#     echo "Habilitando ZRAM para mejorar rendimiento..."
#     sudo apt install -y zram-tools
# }

# Configurar Swappiness para optimizar uso de RAM
# optimizar_swappiness() {
#     echo "Optimizando Swappiness..."
#     echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
#     sudo sysctl -p
# }

### EJECUCIÓN DEL SCRIPT ###
actualizar_sistema
instalar_paquetes
instalar_multimedia
instalar_flatpak
configurar_cinnamon
optimizar_memoria
configurar_firewall
corregir_errores_comunes
limpiar_sistema

# Descomenta las siguientes líneas si deseas activar las opciones avanzadas
# instalar_nvidia
# instalar_software_extra
# activar_trim_ssd
# habilitar_zram
# optimizar_swappiness

echo "--------------------------------------------"
echo "✅ Configuración y optimización completada"
echo "💻 Reinicia el sistema para aplicar los cambios"
echo "🔥 Script creado por -> SysRiot"
echo "📂 Repositorio: https://github.com/SysRiot/Linux-Config"
echo "📜 Log guardado en: $LOGFILE"
echo "--------------------------------------------"
