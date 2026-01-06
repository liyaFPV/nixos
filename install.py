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
    print("2. VM")
    hosts = input()
    return hosts

def install_VM():
    os.system("cp -r host/VM/app/ /etc/nixos/")

def install_PC():
    os.system("cp -r host/PC/app/ /etc/nixos/")

def inatall_laptop():
    os.system("cp -r host/Laptop/app/ /etc/nixos/")

def type_install():
    print("select installation type")
    print("1. rebuild")
    print("2. rebuild and reboot")
    print("3. rebuild test")
    print("4. flake lock")

    type=input()

    if type==1:
        os.system("sudo nixos-rebuild switch")
    elif type==2:
        os.system("sudo nixos-rebuild switch")
    elif type==3:
        os.system("sudo nixos-rebuild switch")
    elif type==4:
        os.system("nix flake lock")

def goodbye():
    print("installation completed successfully!")
    print("you are successfully isolated from society")

hello()
host = select_host()
if host == "1":
    install_laptop()
elif host == "2":
    install_PC()
elif host == "3":
    install_VM()

goodbye()
