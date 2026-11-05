#!/usr/bin/env bash
# Thank you claudiu (claude)
set -euo pipefail

root=${1:?usage: make-index.sh <site-dir>}
root=${root%/}

cp "$(dirname "${BASH_SOURCE[0]}")/index.css" "$root/index.css"

html_escape() {
	local s=$1
	s=${s//&/&amp;}
	s=${s//</&lt;}
	s=${s//>/&gt;}
	s=${s//\"/&quot;}
	printf '%s' "$s"
}

url_encode() {
	local s=$1
	s=${s//%/%25}
	s=${s// /%20}
	s=${s//#/%23}
	s=${s//\?/%3F}
	printf '%s' "$s"
}

# "../" repeated $1 times, or "./" for 0.
up_path() {
	if (($1 == 0)); then printf './'; else printf '../%.0s' $(seq 1 "$1"); fi
}

# Breadcrumb links, relative to the current directory. $1 = relative path ("" for root).
breadcrumbs() {
	local rel=$1 parts=() n k ups href
	[ -n "$rel" ] && IFS=/ read -ra parts <<<"$rel"
	n=${#parts[@]}
	printf '<a href="%s">/</a>' "$(up_path "$n")"
	for ((k = 0; k < n; k++)); do
		printf '<a href="%s">%s</a>/' "$(up_path $((n - 1 - k)))" "$(html_escape "${parts[k]}")"
	done
}

# Prints one table row for a directory entry.
entry_row() {
	local entry=$1 name kind href size
	name=${entry##*/}
	if [ -d "$entry" ]; then
		kind=dir
		href="$(url_encode "$name")/"
		name="$name/"
		size="-"
	else
		kind=file
		href="$(url_encode "$name")"
		size=$(numfmt --to=iec-i --suffix=B "$(stat -c %s "$entry")")
	fi
	printf '<tr><td class="name"><a class="%s" href="%s">%s</a></td><td class="date">%s</td><td class="num">%s</td></tr>\n' \
		"$kind" "$href" "$(html_escape "$name")" "$(date -u -r "$entry" '+%Y-%m-%d %H:%M')" "$size"
}

while IFS= read -r -d '' dir; do
	rel=${dir#"$root"}
	rel=${rel#/}
	title="/${rel:+$rel/}"
	depth=0
	[ -n "$rel" ] && depth=$(tr -cd / <<<"$rel" | wc -c) && depth=$((depth + 1))
	{
		printf '<!doctype html>\n<html lang="en">\n<meta charset="utf-8">\n'
		printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
		printf '<meta name="color-scheme" content="light dark">\n'
		printf '<title>Index of %s</title>\n<link rel="stylesheet" href="%sindex.css">\n' "$(html_escape "$title")" "$(up_path "$depth")"
		printf '<h1>Index of %s</h1>\n<nav>%s</nav>\n' "$(html_escape "$title")" "$(breadcrumbs "$rel")"
		printf '<div class="table-wrap"><table>\n<thead><tr><th>Name</th><th class="date">Last modified</th><th class="num">Size</th></tr></thead>\n<tbody>\n'
		[ -n "$rel" ] && printf '<tr><td class="name"><a class="up" href="../">../</a></td><td class="date"></td><td class="num"></td></tr>\n'
		for type in d f; do
			while IFS= read -r -d '' entry; do
				case "${entry##*/}" in index.html | index.css) continue ;; esac
				entry_row "$entry"
			done < <(find "$dir" -mindepth 1 -maxdepth 1 -type "$type" -print0 | sort -z)
		done
		printf '</tbody>\n</table></div>\n'
	} >"$dir/index.html"
done < <(find "$root" -type d -print0)
