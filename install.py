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
    print("2. VM")
    hosts = input()
    return hosts

def install_VM():
    os.system("cp -r app/ /etc/nixos/")



def goodbye():
    print("installation completed successfully!")
    print("you are successfully isolated from society")

hello()
host = select_host()
if host == "2":
    install_VM()
elif host == "1":
    print("Laptop installation is not ready yet.")
goodbye()
