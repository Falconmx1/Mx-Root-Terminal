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
