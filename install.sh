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

echo "Select your host:"
echo "1. Laptop"
echo "2. PC"
echo "3. VM"
read -rp "Enter number: " host

sudo cp -r .config /home/liyavr/
sudo cp -r wallpapers /home/liyavr/

case "$host" in
    1)
        sudo cp -r host/Laptop/* /etc/nixos/
        sudo nixos-rebuild switch
        ;;
    2)
        sudo cp -r host/PC/* /etc/nixos/
        sudo nixos-rebuild switch
        ;;
    3)
        sudo cp -r host/VM/* /etc/nixos/
        sudo nixos-rebuild switch
        ;;
    *)
        echo "Invalid option!"
        exit 1
        ;;
esac

echo "Installation completed"
echo "You are successfully isolated from society"
