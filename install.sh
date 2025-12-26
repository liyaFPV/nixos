read -p "Применить системную конфигурацию? (y/n): " answer

case "$answer" in
  y|Y)
    echo "Копирую конфиги пользователя..."
    cp -r .config/hypr* /home/liyavr/.config/hypr/
    cp -r .config/rofi* /home/liyavr/.config/rofi/
    cp -r .config/waybar* /home/liyavr/.config/waybar/

    echo "Копирую конфиги NixOS..."
    sudo cp -r nixos/* /etc/nixos/

    echo "Пересборка системы..."
    sudo nixos-rebuild switch
    ;;
  n|N)
    sudo echo "Копирую только пользовательские конфиги..."
    cp -r .config/hypr* /home/liyavr/.config/hypr/
    cp -r .config/rofi* /home/liyavr/.config/rofi/
    cp -r .config/waybar* /home/liyavr/.config/waybar/
    ;;
  *)
    echo "Ошибка: введите y или n"
    exit 1
    ;;
esac
