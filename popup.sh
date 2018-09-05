
#!/bin/bash
prkill n30f
	MUSIC_DIR=/home/mario/Mario/Music
	COVER=/tmp/cover.png
    
{	album="$(mpc -p 6600 --format %album% current)"
	file="$(mpc -p 6600 --format %file% current)"
	album_dir="${file%/*}"
	[[ -z "$album_dir" ]] && exit 1
	album_dir="$MUSIC_DIR/$album_dir"
	covers="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f -iregex 
".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
	src="$(echo -n "$covers" | head -n1)"
	rm -f "$COVER" 
	convert "$src" -resize 130 -bordercolor "#e7e8eb" -border 5x5 "$COVER"
	n30f -x 220 -y 35 -d ${COVER} -c "pkill n30f"
} &
