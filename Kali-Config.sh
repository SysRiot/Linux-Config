#!/bin/bash
#
# Script de configuración y optimización para Kali Linux
# Autor: SysRiot
# Descripción: Automatiza la configuración inicial y optimización de Kali Linux con opciones personalizables.
# Repositorio: https://github.com/SysRiot/Kali-Config
# V-1.1

set -e  # Detiene la ejecución si ocurre un error

# Definir el archivo de log
LOGFILE="/var/log/sysriot_kali_setup.log"
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
        build-essential software-properties-common kali-linux-large
}

configurar_firewall() {
    echo "Configurando firewall (UFW)..."
    sudo ufw enable
    sudo ufw allow OpenSSH
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
}

optimizar_memoria() {
    echo "Liberando caché de memoria..."
    sync && echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null
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
#     sudo ubuntu-drivers autoinstall
# }

# Instalar herramientas adicionales
# instalar_herramientas_extra() {
#     echo "Instalando herramientas adicionales..."
#     sudo apt install -y metasploit-framework exploitdb wireshark \
#         aircrack-ng hashcat john hydra nmap sqlmap burpsuite \
#         gobuster wfuzz dirb seclists sublist3r theharvester \
#         maltego setoolkit zaproxy bettercap
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

### EJECUCIÓN DEL SCRIPT ###
actualizar_sistema
instalar_paquetes
configurar_firewall
optimizar_memoria
corregir_errores_comunes
limpiar_sistema

# Descomenta las siguientes líneas si deseas activar las opciones avanzadas
# instalar_nvidia
# instalar_herramientas_extra
# activar_trim_ssd
# habilitar_zram

echo "--------------------------------------------"
echo "✅ Configuración y optimización completada"
echo "💻 Reinicia el sistema para aplicar los cambios"
echo "🔥 Script creado por -> SysRiot"
echo "📂 Repositorio: https://github.com/SysRiot/Kali-Config"
echo "📜 Log guardado en: $LOGFILE"
echo "--------------------------------------------"
