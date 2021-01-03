alias chars="bat $DOTFILES/static/chars/*.txt"

local file && for file in $DOTFILES/static/chars/*.txt; do
	file=$(basename --suffix=.txt $file)
	which $file &>/dev/null || alias "$file"="bat $DOTFILES/static/chars/$file.txt"
done && unset file
