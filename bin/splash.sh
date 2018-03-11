#!/bin/sh

# Generate iOS splash screen assets
# splash.png must be named splash.png 
# and be 2436x2463 pixels with the main graphics centered
# 
# Usage:
# splash input.png

convert splash.png -gravity center -crop 640x1136+0+0 Default-568h@2x.png
convert splash.png -gravity center -crop 750x1134+0+0 Default-667h@2x.png
convert splash.png -gravity center -crop 2208x1242+0+0 Default-Landscape-736h@3x.png
convert splash.png -gravity center -crop 1242x2208+0+0 Default-Portrait-736h@3x.png
convert splash.png -gravity center -crop 640x960+0+0 Default@2x.png
convert splash.png -gravity center -crop 1125x2436+0+0 Default-Portrait-2436h@3x.png
convert splash.png -gravity center -crop 2436x1125+0+0 Default-Landscape-2436h@3x.png
