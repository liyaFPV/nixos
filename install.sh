read -p "Применить системную конфигурацию? (y/n): " answer

case "$answer" in
  y|Y)
    echo "Копирую конфиги пользователя..."
    sudo cp -r .config/* /home/liyavr/.config/

    echo "Копирую конфиги NixOS..."
    sudo cp -r nixos/* /etc/nixos/

    echo "Пересборка системы..."
    sudo nixos-rebuild switch
    ;;
  n|N)
    sudo echo "Копирую только пользовательские конфиги..."
    cp -r .config/* /home/liyavr/.config/
    ;;
  *)
    echo "Ошибка: введите y или n"
    exit 1
    ;;
esac
