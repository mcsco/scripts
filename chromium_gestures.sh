#!/bin/sh

cp /usr/share/applications/chromium.desktop $HOME/.local/share/applications/

echo "Add"
echo "--enable-features=TouchpadOverscrollHistoryNavigation"
echo "at the end of &"
$EDITOR .local/share/applications/chromium.desktop
