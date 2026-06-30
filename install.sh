#!/bin/bash

# Mx Root Terminal - Script de Instalación
# Autor: Falconmx1

ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # Sin Color

echo -e "${ROJO}"
echo "  ███╗   ███╗██╗  ██╗"
echo "  ████╗ ████║╚██╗██╔╝"
echo "  ██╔████╔██║ ╚███╔╝ "
echo "  ██║╚██╔╝██║ ██╔██╗ "
echo "  ██║ ╚═╝ ██║██╔╝ ██╗"
echo "  ╚═╝     ╚═╝╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${ROJO}⚡ Instalando Mx Root Terminal...${NC}"

# 1. Detectar el sistema operativo
if grep -q Microsoft /proc/version; then
    echo -e "${VERDE}➜ Sistema WSL detectado.${NC}"
    ES_WSL=true
else
    echo -e "${VERDE}➜ Sistema Linux nativo detectado.${NC}"
    ES_WSL=false
fi

# 2. Actualizar e instalar dependencias
echo -e "${VERDE}➜ Actualizando paquetes e instalando herramientas...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y zsh git wget curl nmap netdiscover hydra john gobuster nikto netcat-openbsd

# 3. Instalar Oh My Zsh (de forma no interactiva)
echo -e "${VERDE}➜ Instalando Oh My Zsh...${NC}"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 4. Configurar el tema personalizado de Mx
echo -e "${VERDE}➜ Configurando tema Mx Root...${NC}"
ZSHRC_PATH="$HOME/.zshrc"
# Creamos un respaldo por si acaso
cp $ZSHRC_PATH ${ZSHRC_PATH}.bak

# Escribimos la nueva configuración
cat > $ZSHRC_PATH << 'EOF'
# Mx Root Terminal Custom Zsh Config
ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Prompt personalizado estilo Kali
PROMPT='%{$fg[red]%}┌──(root㉿Mx)-[%{$fg[blue]%}%~%{$fg[red]%}]
%{$fg[red]%}└─%{$reset_color%}# '
EOF

# 5. Crear scripts personalizados
echo -e "${VERDE}➜ Creando scripts Mx...${NC}"
sudo cat > /usr/local/bin/mx-info << 'EOF'
#!/bin/bash
echo -e "\033[0;31m=== Mx System Info ===\033[0m"
echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
echo "Distro: $(lsb_release -ds 2>/dev/null || cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
EOF
sudo chmod +x /usr/local/bin/mx-info

sudo cat > /usr/local/bin/mx-update << 'EOF'
#!/bin/bash
echo -e "\033[0;31mActualizando herramientas de Mx Root Terminal...\033[0m"
sudo apt update && sudo apt upgrade -y
echo -e "\033[0;32m¡Actualización completada!\033[0m"
EOF
sudo chmod +x /usr/local/bin/mx-update

# 6. Cambiar la shell por defecto a zsh
echo -e "${VERDE}➜ Estableciendo Zsh como shell por defecto...${NC}"
sudo chsh -s $(which zsh) $USER

echo -e "${ROJO}=========================================${NC}"
echo -e "${VERDE}✅ ¡Instalación completada, bro!${NC}"
echo -e "${VERDE}➜ Cierra esta sesión y vuelve a abrir la terminal para ver los cambios.${NC}"
echo -e "${VERDE}➜ Prueba los comandos: mx-info y mx-update${NC}"
echo -e "${ROJO}=========================================${NC}"
