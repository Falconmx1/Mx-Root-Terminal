# 🔴 Mx Root Terminal

[![Version](https://img.shields.io/badge/version-1.0.0-red.svg)](https://github.com/Falconmx1/Mx-Root-Terminal)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux-blue)](https://github.com/Falconmx1/Mx-Root-Terminal)

**¡Bienvenido a la Mx Root Terminal!** El emulador de terminal definitivo para los que buscan el poder y la estética de Kali Linux, pero con la flexibilidad de Zsh. Diseñado para correr en Windows y Linux, esta terminal te da un entorno root (con estilo) lleno de herramientas listas para usar.

## 🚀 Características

- 🎨 **Estilo Kali Linux:** Interfaz con temática roja y negra, auténtica sensación de "root".
- 🐚 **Potenciado por Zsh:** Disfruta de autocompletado avanzado, temas y plugins con Oh My Zsh.
- 🛠️ **Herramientas Incluidas:** Un conjunto de scripts y utilidades para pentesting, redes y sysadmin (similar a Kali).
- 💻 **Multiplataforma:** Funciona a la perfección en **Windows** (con WSL2) y **Linux** (nativo).
- ⚙️ **Configuración Automática:** Un solo script para tener todo listo en minutos.

## 🔧 Instalación

### En Linux (Debian/Ubuntu)
```bash
git clone https://github.com/Falconmx1/Mx-Root-Terminal
cd Mx-Root-Terminal
chmod +x install.sh
./install.sh

En Windows (WSL2)
Asegúrate de tener WSL2 con una distro de Linux (ej. Ubuntu).

Abre tu terminal de WSL y ejecuta:

git clone https://github.com/Falconmx1/Mx-Root-Terminal
cd Mx-Root-Terminal
./install.sh

(El script detectará automáticamente que estás en WSL)

📦 Herramientas Incluidas
La terminal viene con un conjunto de herramientas preinstaladas y accesibles desde la línea de comandos:

Escaneo de Redes: nmap, netdiscover

Ataques de Fuerza Bruta: hydra, john

Análisis Web: gobuster, nikto

Utilidades de Red: curl, wget, netcat

Scripts Propios: mx-info (Muestra info del sistema), mx-update (Actualiza herramientas).

🎨 Personalización
La terminal usa Zsh con el tema agnoster modificado para que coincida con el rojo de Kali. Puedes cambiar el tema editando el archivo ~/.zshrc.

Para cambiar el color del prompt, busca la línea:
PROMPT='%{$fg[red]%}┌──(root㉿Mx)-[%{$fg[blue]%}%~%{$fg[red]%}]
%{$fg[red]%}└─%{$reset_color%}# '

🎯 Prueba rápida después de instalar

# Ver todas las herramientas instaladas
mx-tools

# Probar las herramientas
mx-test

# Ver ayuda completa
mx-help

# Listar todas las herramientas instaladas
dpkg -l | grep -E "nmap|hydra|john|gobuster|nikto|aircrack|sqlmap|wpscan|metasploit|burp" | awk '{print $2}'

# Actualizar paquetes
mx-update


📋 Lista completa de herramientas incluidas
Herramientas de red y escaneo
nmap - Escaneo de puertos y redes

netdiscover - Descubrimiento de dispositivos en red

dnsrecon - Escaneo DNS

enum4linux - Enumeración de servicios SMB

smbclient - Cliente SMB

tcpdump - Captura de paquetes

wireshark - Analizador de tráfico (GUI)

Herramientas de seguridad y hacking
hydra - Fuerza bruta

john - Cracker de contraseñas

hashcat - Cracker de contraseñas (GPU)

medusa - Fuerza bruta

aircrack-ng - Suite para auditoría WiFi

sqlmap - Detección de SQL Injection

wpscan - Escáner para WordPress

recon-ng - Reconocimiento web

nikto - Escáner de vulnerabilidades web

gobuster - Descubrimiento de directorios web

metasploit-framework - Framework de explotación (opcional)

burpsuite - Proxy para análisis web (opcional)

Herramientas de análisis y forense
exploitdb - Base de datos de exploits

crunch - Generador de diccionarios

cewl - Generador de diccionarios desde webs

foremost - Recuperación de archivos

binwalk - Análisis de firmware

steghide - Esteganografía

exiftool - Metadatos de archivos

yara - Escaneo de malware

clamav - Antivirus

rkhunter - Detección de rootkits

chkrootkit - Detección de rootkits

lynis - Auditoría de seguridad

Utilidades generales
whois - Consulta WHOIS

dnsutils - Herramientas DNS (nslookup, dig)

openssl - Criptografía

sshpass - SSH con contraseña

macchanger - Cambiar MAC address

torsocks - Proxy Tor

proxychains - Proxy chains

iptables - Firewall

ufw - Firewall simplificado

fail2ban - Protección contra ataques

secure-delete - Borrado seguro

scrot - Capturas de pantalla

imagemagick - Manipulación de imágenes

ffmpeg - Procesamiento de audio/video

Herramientas de hardening y mantenimiento
auditd - Auditoría del sistema

debsums - Verificación de paquetes

xpdf - Visor de PDF (para análisis de documentos)


⚠️ Notas importantes
Metasploit y Burp Suite son opcionales porque pesan mucho (~500MB cada uno)

Algunas herramientas requieren permisos root (usar sudo)

wpscan necesita API token para funcionar correctamente (puedes obtener uno gratis en su web)

aircrack-ng necesita una interfaz WiFi en modo monitor (no funciona en WSL)
