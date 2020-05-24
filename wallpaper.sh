#/bin/bash
mkdir -p $HOME/Wallpapers
cp $HOME/.config/wall.png $HOME/Wallpapers/wall_$(date +%s).png
cp $1 $HOME/.config/wall.png
feh --bg-scale /home/javiles/.config/wall.png
