#!/bin/sh

cp /usr/share/applications/chromium.desktop $HOME/.local/share/applications/
cp /usr/share/applications/brave-browser.desktop $HOME/.local/share/applications/

echo "Add"
echo "--enable-features=TouchpadOverscrollHistoryNavigation"
echo "--disable-features=GlobalShortcutsPortal"
echo "at the end of &"
$EDITOR .local/share/applications/chromium.desktop
$EDITOR .local/share/applications/brave-browser.desktop
