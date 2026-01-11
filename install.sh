
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
read -p "Enter number: " host

# ---------------------------
# Установка базовых файлов
# ---------------------------
sudo cp -r .config /home/liyavr/
sudo cp -r wallpapers /home/liyavr/

# ---------------------------
# Действия по выбранному хосту
# ---------------------------
if [ "$host" = "1" ]; then
    sudo cp -r host/Laptop /etc/nixos/
    sudo nixos-rebuild switch --flake .#laptop
elif [ "$host" = "2" ]; then
    sudo cp -r host/PC /etc/nixos/
    sudo nixos-rebuild switch --flake .#pc
elif [ "$host" = "3" ]; then
    sudo cp -r host/VM /etc/nixos/
    sudo nixos-rebuild switch --flake .#vm
elif [ "$host" = "4" ]; then
    ./flake.sh
else
    echo "Invalid option!"
fi

# ---------------------------
# Завершение
# ---------------------------
echo "Installation completed successfully!"
echo "You are successfully isolated from society"
