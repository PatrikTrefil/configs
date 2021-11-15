# Functions
cheat(){
  xdg-open "$(du -a /home/patriktrefil/Mega/Documents/Other/cheatsheets | awk '{print $2}' | fzf)"
}

## rga - recursive ripgrep
## files-with-matches - only print file paths with matches
## -uu - hidden
## pretty context - colors
## phony - not a finder, but a selector
## bind - on change of the query reload the rga
rga-fzf() {
	RG_PREFIX="rga --files-with-matches -uu"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="60%:wrap"
	)" &&
	echo "opening $file" &&
	$EDITOR "$file"
}

## mainly latex cleanup
cleanup() { rm -f *.dvi *.log *.aux }

## cd using fzf
# cd_fzf() { cd "$(find . -type d 2>/dev/null | fzf)" }
cd_fzf() { cd "$(search-directory)" }
