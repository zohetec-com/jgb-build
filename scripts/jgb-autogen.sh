#!/bin/sh
set -e

aclocal
autoheader
automake --gnu --add-missing --copy
autoconf
