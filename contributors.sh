#! /bin/sh

echo "number of lines"
find . -type f | egrep -v "\.git" | xargs -n 1 git blame | perl -p -e 's/^[^(]+\(([^0-9]+).+/$1/' | uniq -c | sort -r

echo "\nnumber of solutions"
find . -type f | egrep -v "/\.git/" | cut -f 2 -d "_" | grep -v / | cut -f 1 -d "." | uniq -c | sort -r