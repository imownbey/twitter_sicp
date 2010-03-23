#! /bin/sh

find . -type f | egrep -v "\.git" | xargs -n 1 git blame | perl -p -e 's/^[^(]+\(([^0-9]+).+/$1/' | uniq -c | sort -r