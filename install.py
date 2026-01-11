import os
import shutil

def hello():
    print(r" /$$       /$$                     /$$$$$$$$ /$$$$$$$  /$$    /$$")
    print(r"| $$      |__/                    | $$_____/| $$__  $$| $$   | $$")
    print(r"| $$       /$$ /$$   /$$  /$$$$$$ | $$      | $$  \ $$| $$   | $$")
    print(r"| $$      | $$| $$  | $$ |____  $$| $$$$$   | $$$$$$$/|  $$ / $$/")
    print(r"| $$      | $$| $$  | $$  /$$$$$$$| $$__/   | $$____/  \  $$ $$/ ")
    print(r"| $$      | $$| $$  | $$ /$$__  $$| $$      | $$        \  $$$/  ")
    print(r"| $$$$$$$$| $$|  $$$$$$$|  $$$$$$$| $$      | $$         \  $/   ")
    print(r"|________/|__/ \____  $$ \_______/|__/      |__/          \_/    ")
    print(r"               /$$  | $$                                         ")
    print(r"              |  $$$$$$/                                         ")
    print(r"               \______/                                          ")
    print(r" /$$   /$$ /$$$$$$ /$$   /$$  /$$$$$$   /$$$$$$                  ")
    print(r"| $$$ | $$|_  $$_/| $$  / $$ /$$__  $$ /$$__  $$                 ")
    print(r"| $$$$| $$  | $$  |  $$/ $$/| $$  \ $$| $$  \__/                 ")
    print(r"| $$ $$ $$  | $$   \  $$$$/ | $$  | $$|  $$$$$$                  ")
    print(r"| $$  $$$$  | $$    >$$  $$ | $$  | $$ \____  $$                 ")
    print(r"| $$\  $$$  | $$   /$$/\  $$| $$  | $$ /$$  \ $$                 ")
    print(r"| $$ \  $$ /$$$$$$| $$  \ $$|  $$$$$$/|  $$$$$$/                 ")
    print(r"|__/  \__/|______/|__/  |__/ \______/  \______/                  ")
                                                                 
                                                                 


def select_host():
    print("select your host:")
    print("1. Laptop")
    print("2. PC")
    print("3. VM")
    print("4. build flake")
    hosts = input()
    return hosts

def build_flake():
    os.system("./flake.sh")

def install_base():
    os.system("sudo cp -r .config /home/liyavr/")
    os.system("sudo cp -r wallpapers /home/liyavr/")

def install_laptop():
    os.system("sudo cp -r host/Laptop /etc/nixos/")
    os.system("sudo nixos-rebuild switch --flake .#laptop")

def install_pc():
    os.system("sudo cp -r host/PC /etc/nixos/")
    os.system("sudo nixos-rebuild switch --flake .#pc")

def install_VM():
    os.system("sudo cp -r host/VM /etc/nixos/")
    os.system("sudo nixos-rebuild switch --flake .#vm")

def goodbye():
    print("installation completed successfully!")
    print("you are successfully isolated from society")

hello()
host = select_host()
install_base()
if host == "1":
    install_laptop()
elif host == "2":
    install_pc()
elif host == "3":
    install_VM()
elif host == "4":
    build_flake()
goodbye()
