#!/bin/bash

hello() {
    cat <<'EOF'
 /$$       /$$                     /$$$$$$$$ /$$$$$$$  /$$    /$$
| $$      |__/                    | $$_____/| $$__  $$| $$   | $$
| $$       /$$ /$$   /$$  /$$$$$$ | $$      | $$  \ $$| $$   | $$
| $$      | $$| $$  | $$ |____  $$| $$$$$   | $$$$$$$/|  $$ / $$
| $$      | $$| $$  | $$  /$$$$$$$| $$__/   | $$____/  \  $$ $$/ 
| $$      | $$| $$  | $$ /$$__  $$| $$      | $$        \  $$$/  
| $$$$$$$$| $$|  $$$$$$$|  $$$$$$$| $$      | $$         \  $/   
|________/|__/ \____  $$ \_______/|__/      |__/          \_/    
               /$$  | $$                                         
              |  $$$$$$/                                         
               \______/                                          
 /$$   /$$ /$$$$$$ /$$   /$$  /$$$$$$   /$$$$$$                  
| $$$ | $$|_  $$_/| $$  / $$ /$$__  $$ /$$__  $$                 
| $$$$| $$  | $$  |  $$/ $$/| $$  \ $$| $$  \__/                 
| $$ $$ $$  | $$   \  $$$$/ | $$  | $$|  $$$$$$                  
| $$  $$$$  | $$    >$$  $$ | $$  | $$ \____  $$                 
| $$\  $$$  | $$   /$$/\  $$| $$  | $$ /$$  \ $$                 
| $$ \  $$ /$$$$$$| $$  \ $$|  $$$$$$/|  $$$$$$/                 
|__/  \__/|______/|__/  |__/ \______/  \______/                  
EOF
}

goodbye() {
    echo "installation completed successfully!"
    echo "you are successfully isolated from society"
}

select_host() {
    echo "select your host:"
    echo "1. Laptop"
    echo "2. PC"
    echo "3. VM"
    echo "4. build flake"
    read -r host
    echo "$host"
}

install_base() {
    sudo cp -r .config /home/liyavr/
    sudo cp -r wallpapers /home/liyavr/
}

install_laptop() {
    sudo cp -r host/Laptop /etc/nixos/
    sudo nixos-rebuild switch --flake .#laptop
}

install_pc() {
    sudo cp -r host/PC /etc/nixos/
    sudo nixos-rebuild switch --flake .#pc
}

install_vm() {
    sudo cp -r host/VM /etc/nixos/
    sudo nixos-rebuild switch --flake .#vm
}

build_flake() {
    ./flake.sh
}

# Main
hello
host=$(select_host)
install_base

case "$host" in
    1) install_laptop ;;
    2) install_pc ;;
    3) install_vm ;;
    4) build_flake ;;
    *) echo "Invalid option" ;;
esac

goodbye
