set -e

# ---------------------------
# ASCII-баннер
# ---------------------------
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

# ---------------------------
# Выбор хоста
# ---------------------------
echo "Select your host:"
echo "1. Laptop"
echo "2. PC"
echo "3. VM"
echo "4. Build flake"
read -rp "Enter number: " host

# ---------------------------
# Первая установка?
# ---------------------------
read -rp "Is this your first installation? (y/n): " first_install

CONFIG_FILE="/etc/nixos/configuration.nix"
EXPERIMENTAL_LINE='nix.settings.experimental-features = [ "nix-command" "flakes" ];'

if [[ "$first_install" =~ ^[Yy]$ ]]; then
    echo "First installation detected"

    if ! grep -q 'experimental-features' "$CONFIG_FILE"; then
        echo "Adding experimental Nix features..."

        sudo sed -i '/system.stateVersion = "25.11";/a\
\
  nix.settings.experimental-features = [ "nix-command" "flakes" ];' "$CONFIG_FILE"

        sudo nixos-rebuild switch
    else
        echo "Experimental features already enabled"
    fi
else
    echo "Not first installation, continuing without changes"
fi

# ---------------------------
# Установка базовых файлов
# ---------------------------
sudo cp -r .config /home/liyavr/
sudo cp -r wallpapers /home/liyavr/

# ---------------------------
# Действия по выбранному хосту
# ---------------------------
case "$host" in
    1)
        sudo cp -r host/Laptop/* /etc/nixos/
        sudo nixos-rebuild switch --flake .#laptop
        ;;
    2)
        sudo cp -r host/PC/* /etc/nixos/
        sudo nixos-rebuild switch --flake .#pc
        ;;
    3)
        sudo cp -r host/VM/* /etc/nixos/
        sudo nixos-rebuild switch --flake .#vm
        ;;
    4)
        ./flake.sh
        ;;
    *)
        echo "Invalid option!"
        exit 1
        ;;
esac

# ---------------------------
# Завершение
# ---------------------------
echo "Installation completed"
echo "You are successfully isolated from society"
