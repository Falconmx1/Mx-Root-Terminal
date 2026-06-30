#!/bin/bash

# Mx Root Terminal - Script de Instalación
# Autor: Falconmx1
# Versión: 1.3.0

ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
NC='\033[0m'

echo -e "${ROJO}"
echo "  ███╗   ███╗██╗  ██╗"
echo "  ████╗ ████║╚██╗██╔╝"
echo "  ██╔████╔██║ ╚███╔╝ "
echo "  ██║╚██╔╝██║ ██╔██╗ "
echo "  ██║ ╚═╝ ██║██╔╝ ██╗"
echo "  ╚═╝     ╚═╝╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${ROJO}⚡ Instalando Mx Root Terminal...${NC}"
echo ""

echo -e "${AZUL}➜ Detectando sistema operativo...${NC}"
if grep -q Microsoft /proc/version; then
    echo -e "${VERDE}   ✅ Sistema WSL detectado.${NC}"
else
    echo -e "${VERDE}   ✅ Sistema Linux nativo detectado.${NC}"
fi
echo ""

echo -e "${AZUL}➜ Actualizando paquetes e instalando herramientas...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y zsh git wget curl nmap netdiscover hydra john gobuster nikto netcat-openbsd
echo -e "${VERDE}   ✅ Herramientas instaladas correctamente.${NC}"
echo ""

echo -e "${AZUL}➜ Instalando Oh My Zsh...${NC}"
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${AMARILLO}   ⚠️  Oh My Zsh ya está instalado. Saltando...${NC}"
else
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "${VERDE}   ✅ Oh My Zsh instalado correctamente.${NC}"
fi
echo ""

echo -e "${AZUL}➜ Configurando tema Mx Root...${NC}"
ZSHRC_PATH="$HOME/.zshrc"
if [ ! -f "${ZSHRC_PATH}.bak" ]; then
    cp $ZSHRC_PATH ${ZSHRC_PATH}.bak
    echo -e "${VERDE}   ✅ Respaldo creado en ${ZSHRC_PATH}.bak${NC}"
fi

cat >> $ZSHRC_PATH << 'EOF'

# ============================================
# Mx Root Terminal Custom Configuration
# ============================================

PROMPT='%{$fg[red]%}┌──(root㉿Mx)-[%{$fg[blue]%}%~%{$fg[red]%}]
%{$fg[red]%}└─%{$reset_color%}# '

alias mx='cd ~/Mx-Root-Terminal'
alias mx-help='echo "Comandos Mx: mx-info, mx-update, mx-wifi, mx-scan, mx-clean"'

EOF

echo -e "${VERDE}   ✅ Tema Mx Root configurado.${NC}"
echo ""

echo -e "${AZUL}➜ Creando scripts Mx...${NC}"

create_script() {
    local script_name=$1
    local script_content=$2
    echo "$script_content" | sudo tee /usr/local/bin/$script_name > /dev/null
    sudo chmod +x /usr/local/bin/$script_name
    echo -e "${VERDE}   ✅ $script_name creado.${NC}"
}

create_script "mx-info" '#!/bin/bash
echo -e "\033[0;31m=== Mx System Info ===\033[0m"
echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
if command -v lsb_release &> /dev/null; then
    echo "Distro: $(lsb_release -ds)"
else
    echo "Distro: $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d= -f2 | tr -d "\""")"
fi
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Shell: $SHELL"
'

create_script "mx-update" '#!/bin/bash
echo -e "\033[0;31mActualizando herramientas de Mx Root Terminal...\033[0m"
sudo apt update && sudo apt upgrade -y
echo -e "\033[0;32m✅ ¡Actualización completada!\033[0m"
'

create_script "mx-wifi" '#!/bin/bash
echo -e "\033[0;31m=== Mx WiFi Scanner ===\033[0m"
echo "Escaneando redes WiFi disponibles..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v iwlist &> /dev/null; then
        sudo iwlist wlan0 scan | grep -E "ESSID|Quality"
    else
        echo "⚠️  iwlist no encontrado. Instala wireless-tools."
    fi
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    netsh wlan show networks
else
    echo "⚠️  Sistema no soportado para este comando."
fi
'

create_script "mx-scan" '#!/bin/bash
if [ -z "$1" ]; then
    echo -e "\033[0;31mUso: mx-scan <IP/red>\033[0m"
    echo "Ejemplo: mx-scan 192.168.1.0/24"
    exit 1
fi
echo -e "\033[0;31m=== Mx Network Scan ===\033[0m"
echo "Escaneando: $1"
nmap -sn $1
'

create_script "mx-clean" '#!/bin/bash
echo -e "\033[0;31m=== Mx System Cleaner ===\033[0m"
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
> ~/.bash_history
sudo rm -rf /tmp/*
echo -e "\033[0;32m✅ Limpieza completada.\033[0m"
'

create_script "mx-help" '#!/bin/bash
echo -e "\033[0;31m=== Mx Root Terminal Help ===\033[0m"
echo -e "\033[1;33mComandos disponibles:\033[0m"
echo "  mx-info     - Muestra información del sistema"
echo "  mx-update   - Actualiza todas las herramientas"
echo "  mx-wifi     - Escanea redes WiFi disponibles"
echo "  mx-scan     - Escanea una red con nmap (ej. mx-scan 192.168.1.0/24)"
echo "  mx-clean    - Limpia archivos temporales y caché"
echo "  mx-help     - Muestra esta ayuda"
echo ""
echo -e "\033[1;33mAlias:\033[0m"
echo "  mx          - Navega a la carpeta del proyecto"
'

echo ""

echo -e "${AZUL}➜ Estableciendo Zsh como shell por defecto...${NC}"
if [[ "$SHELL" != *"zsh"* ]]; then
    sudo chsh -s $(which zsh) $USER
    echo -e "${VERDE}   ✅ Shell cambiada a Zsh.${NC}"
else
    echo -e "${AMARILLO}   ⚠️  Zsh ya es la shell por defecto.${NC}"
fi
echo ""

echo -e "${ROJO}=========================================${NC}"
echo -e "${VERDE}✅ ¡Instalación completada, bro!${NC}"
echo -e "${AMARILLO}➜ Cierra esta sesión y vuelve a abrir la terminal para ver los cambios.${NC}"
echo -e "${AMARILLO}➜ Prueba los comandos: mx-info, mx-update, mx-wifi, mx-scan, mx-clean${NC}"
echo -e "${AMARILLO}➜ Para ver la ayuda: mx-help${NC}"
echo -e "${ROJO}=========================================${NC}"
