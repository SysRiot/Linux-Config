<h1 align="center">| Linux Config - Scripts de Configuración y Optimización |</h1>

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo-ubuntu_cof-orange-hex.svg" alt="Ubuntu Logo" width="100"/>
  <img src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Linux_Mint_logo_without_wordmark.svg" alt="Linux Mint Logo" width="100"/>
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/2b/Kali-dragon-icon.svg" alt="Kali Linux Logo" width="100"/>
</p>

## 📌 Descripción
**Linux Config** es una colección de scripts automatizados diseñados para optimizar y configurar Ubuntu, Linux Mint y Kali Linux después de una instalación limpia. Cada script está adaptado a su respectiva distribución, proporcionando actualizaciones del sistema, instalación de herramientas esenciales, ajustes de rendimiento, seguridad y optimización avanzada según las necesidades de cada usuario.

📂 **Repositorio Oficial:** [SysRiot - GitHub](https://github.com/SysRiot/Linux-Config)

---

## ⚡ Características del Script
✔ **Actualización del sistema**: Descarga e instala las últimas actualizaciones de paquetes.

✔ **Instalación de herramientas esenciales**: Incluye paquetes básicos y utilidades del sistema.

✔ **Configuración de entorno**: Ajustes visuales y de usabilidad.

✔ **Optimización de memoria**: Liberación de caché y optimización del uso de RAM.

✔ **Configuración de Firewall (UFW)**: Asegura la conexión con reglas predefinidas.

✔ **Corrección de errores comunes**: Repara paquetes rotos y problemas de dependencias.

✔ **Limpieza del sistema**: Elimina paquetes innecesarios y libera espacio.

✔ **Compatibilidad con NVIDIA** *(opcional)*: Instalación manual de controladores gráficos.

✔ **Instalación de PulseAudio**: Configuración de sonido avanzada.

✔ **Herramientas de desarrollo**: Python, Node.js, Docker y más.

✔ **Opciones avanzadas** *(opcional)*: TRIM para SSD, ZRAM para rendimiento, Steam y Lutris para gaming.

---

## 📜 Instalación y Uso
### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/SysRiot/Linux-Config.git
cd Linux-Config
```
### 2️⃣ Dar permisos de ejecución
```bash
chmod +x Ubuntu-Config.sh
```
### 3️⃣ Ejecutar el script
```bash
./Ubuntu-Config.sh
```

📌 **Para Linux Mint y Kali Linux, simplemente reemplaza `Ubuntu-Config.sh` por `LinuxMint-Config.sh` o `Kali-Config.sh` en los pasos anteriores.**

---

### 4️⃣ Editar Archivo
```bash
nano "NombreDelScript.sh"  # Sustituye por el script que deseas editar
```
📌 **EDITAR EL ARCHIVO SEGUN LO QUE REQUIERAS.**

---

## 📦 Paquetes Instalados
### 🔹 Herramientas esenciales
- `curl`, `wget`, `git`, `vim`, `htop`, `net-tools`, `unzip`, `zip`
- `build-essential`, `software-properties-common`, `gnome-tweaks`, `gnome-shell-extensions`
- `neofetch`, `preload`, `ufw`, `timeshift`

### 🎥 Multimedia
- `ubuntu-restricted-extras` *(Codecs de audio y video)*
- `ffmpeg`, `vlc`

### 📦 Soporte de Paquetería
- `flatpak`, `gnome-software-plugin-flatpak`
- `snap`, `snap-store`

### 🛡 Seguridad y Firewall
- `ufw` *(Firewall configurado automáticamente)*

### 🎮 Gaming *(opcional, desactivado por defecto)*
- `steam`, `lutris`

### 🖥 Optimización *(opcional, desactivado por defecto)*
- `zram-tools` *(Habilitar ZRAM para mejorar rendimiento en PCs con poca RAM)*
- `fstrim.timer` *(Activar TRIM para SSD)*

---

## ⚠ Solución de Problemas
### 🔹 Permisos denegados al ejecutar el script
Solución:
```bash
chmod +x NombreDelScript.sh
./NombreDelScript.sh
```

### 🔹 No se reconoce el comando `sudo`
Solución:
```bash
su -
apt install sudo
```

### 🔹 Error: `Unable to lock the administration directory`
Solución:
```bash
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/apt/lists/lock
sudo dpkg --configure -a
```

---

📌 **Autor:** [SysRiot](https://github.com/SysRiot) 🚀
