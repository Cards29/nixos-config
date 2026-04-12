#!/usr/bin/env bash
# Cycle through wallpapers in WALLPAPER_DIR serially

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
STATE_FILE="$HOME/.cache/swww_last_wallpaper"
CURRENT_WALLPAPER_CACHE="$HOME/.cache/current_wallpaper"

# Ensure swww-daemon is running
if ! pgrep -x "swww-daemon" > /dev/null; then
  swww-daemon &
  sleep 0.5 # Give it a moment to initialize
fi

# Ensure wallpaper directory exists
if [[ ! -d "$WALLPAPER_DIR" ]]; then
  echo "Error: $WALLPAPER_DIR does not exist." >&2
  exit 1
fi

# Get all wallpapers sorted alphabetically
mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -type f | sort)

if [[ ${#wallpapers[@]} -eq 0 ]]; then
  echo "Error: No wallpapers found in $WALLPAPER_DIR" >&2
  exit 1
fi

# Determine the next wallpaper
last_wallpaper=""
if [[ -f "$STATE_FILE" ]]; then
  last_wallpaper=$(cat "$STATE_FILE")
fi

next_index=0
for i in "${!wallpapers[@]}"; do
  if [[ "${wallpapers[$i]}" == "$last_wallpaper" ]]; then
    next_index=$(( (i + 1) % ${#wallpapers[@]} ))
    break
  fi
done

selected_wallpaper="${wallpapers[$next_index]}"

# Transition settings
swww img "$selected_wallpaper" \
  --transition-type grow \
  --transition-pos top-right \
  --transition-duration 2 \
  --transition-fps 60

# Update state and cache
mkdir -p "$(dirname "$STATE_FILE")"
echo "$selected_wallpaper" > "$STATE_FILE"
ln -sf "$selected_wallpaper" "$CURRENT_WALLPAPER_CACHE"
