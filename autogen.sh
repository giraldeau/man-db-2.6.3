#! /bin/sh
set -e

if type gnulib-tool >/dev/null 2>&1; then
	autopoint -f
	gnulib-tool --update >/dev/null
	patch -s -p1 <gnulib/gets.patch
	export AUTOPOINT=true
fi
export LIBTOOLIZE_OPTIONS=--quiet
autoreconf -fi "$@"
