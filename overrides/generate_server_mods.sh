#!/bin/bash

set -euo pipefail

if [ ! -d ./mods ]; then
  echo "No mods directory found in the current directory. Is this the root directory of your modpack?"
  exit 1
fi

if [ -d ./server_mods ]; then
  read -p "The server_mods directory already exists. Do you want to overwrite it? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
    printf -- "Removing server_mods directory... "
    rm -rf server_mods
    echo "Done!"
  else
    echo
    echo "Aborting."
    exit 1
  fi
fi
mkdir server_mods

# List of mods that are client-side only
echo "Checking for client-side only mods..."
echo -n >| .client-side-mods-not-matched.txt
cat << __EOF__ | while IFS= read -r mod; do ls -1 ./mods/$mod 2>/dev/null || (echo " Not found: $mod" >> .client-side-mods-not-matched.txt) ; done > .client-side-mods.txt
BetterAdvancements-*
BetterAnimationsCollection-*
BetterModsButton-*
catalogue-*
Controlling-forge-*
configured-*
craftingtweaks-*
Ding-*
dynamiccrosshair-*
extremesoundmuffler-*
FpsReducer2-forge-*
ItemPhysicLite_*
lazydfu-*
dynamiclightsreforged-*
ModernUI-*
MouseTweaks-*
oculus-*
rebind_narrator-*
shutupexperimentalsettings-*
3dskinlayers-forge-*
smoothboot(reloaded)-*
TextruesRubidiumOptions-*
textrues_embeddium_options-*
tia-*
ToastControl-*
suggestion-tweaker-*
shulkerboxtooltip-forge-*
Neat-*
screenshot_viewer-*
screenshot-to-clipboard-*
notenoughanimations-*
BetterAnimationsCollection-*
chat_heads-*
rubidium-*
rubidium_extras-*
reforgium-*
LegendaryTooltips-*
EnhancedBlockEntities-Reforged-*
embeddium-*
connectedness-*
__EOF__
cat .client-side-mods-not-matched.txt
rm .client-side-mods-not-matched.txt

# Copy all mods to the server_mods directory, except the ones listed in .client-side-mods.txt
all_mods=$(find ./mods/ -type f | wc -l)
processed_mods=0
skipped_mods=0
ignored_mods=0
copied_mods=0
spin='-\|/'
echo "Copying $all_mods mods to the server_mods directory..."
while IFS= read -r mod; do
  if [[ "$mod" =~ \.jar\.disabled$ ]]; then
    # Ignore *.jar.disabled file
    echo " Disabled: $mod"
    skipped_mods=$((skipped_mods + 1))
  elif grep -q "^$mod$" .client-side-mods.txt; then
    # Ignore client-side only mods
    echo " Client-side: $mod"
    ignored_mods=$((ignored_mods + 1))
  else
    # Copy the mod to the server_mods directory
    cp -r "$mod" "./server_mods/"
    copied_mods=$((copied_mods + 1))
  fi
  processed_mods=$((processed_mods + 1))
  printf "[%d/%d] %c\r" $processed_mods $all_mods "${spin:$((processed_mods % 4)):1}"
done < <(find ./mods/ -type f)
printf "               \r"
rm .client-side-mods.txt

echo "Results:"
echo " Copied ${copied_mods}/${processed_mods} mods to the server_mods directory."
if [ $skipped_mods -gt 0 ]; then
  echo " Skipped $skipped_mods disabled mods."
fi
if [ $ignored_mods -gt 0 ]; then
  echo " Ignored $ignored_mods client-side only mods."
fi
echo "Done!"
echo "You can now copy the mods from the server_mods directory to your server's mods directory."
