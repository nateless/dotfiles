# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"

function edit() {
  local dir=$1
  [[ -z "$dir" ]] && dir='.'
  $EDITOR $dir
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
	echo "First argument - pattern to grep from processes"
  else
	sum=0
	for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
	  sum=$(($i + $sum))
	done
	sum=$(echo "scale=2; $sum / 1024.0" | bc)
	if [[ $sum != "0" ]]; then
	  echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
	else
	  echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
	fi
  fi
}

# Compare original and gzipped file size
function gz() {
  local origsize=$(wc -c < "$1")
  local gzipsize=$(gzip -c "$1" | wc -c)
  local ratio=$(echo "$gzipsize * 100/ $origsize" | bc -l)
  printf "orig: %d bytes\n" "$origsize"
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
  if [ -t 0 ]; then # argument
	python -mjson.tool <<< "$*" | pygmentize -l javascript
  else # pipe
	python -mjson.tool | pygmentize -l javascript
  fi
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# find shorthand
function f() {
	find . -name "$1"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
  encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# get gzipped size
function gz() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
  if [ -f "$1" ] ; then
	local filename=$(basename "$1")
	local foldername="${filename%%.*}"
	local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
	local didfolderexist=false
	if [ -d "$foldername" ]; then
	  didfolderexist=true
	  read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
	  echo
	  if [[ $REPLY =~ ^[Nn]$ ]]; then
		return
	  fi
	fi
	mkdir -p "$foldername" && cd "$foldername"
	case $1 in
	  *.tar.bz2) tar xjf "$fullpath" ;;
	  *.tar.gz) tar xzf "$fullpath" ;;
	  *.tar.xz) tar Jxvf "$fullpath" ;;
	  *.tar.Z) tar xzf "$fullpath" ;;
	  *.tar) tar xf "$fullpath" ;;
	  *.taz) tar xzf "$fullpath" ;;
	  *.tb2) tar xjf "$fullpath" ;;
	  *.tbz) tar xjf "$fullpath" ;;
	  *.tbz2) tar xjf "$fullpath" ;;
	  *.tgz) tar xzf "$fullpath" ;;
	  *.txz) tar Jxvf "$fullpath" ;;
	  *.zip) unzip "$fullpath" ;;
	  *) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
	esac
  else
	echo "'$1' is not a valid file"
  fi
}


# a few aliases I like
alias gs='git status'
alias ..="cd .."
alias l="ls -laG"
alias la="ls -laG"
alias lsd='ls -laG | grep "^d"'
alias e=edit

# git aliases
alias ga="git add ."
alias gc="git commit -m '$1'"
alias gp="git push $1 master"