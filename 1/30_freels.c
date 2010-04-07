#include <stdlib.h>
#include <stdio.h>

typedef int (* int2int)(int);

int ident(int x) {
  return x;
}

int next(int x) {
  return ++x;
}

int sum ( int (*term)(int), int start, int (*next)(int), int end ) {
  int i, total = 0;

  for (i = start; i <= end; i = (*next)(i))
    total = total + (*term)(i);

  return total;
}

int main(int argc, const char* argv[]) {
  printf("%i\n", sum(ident, 1, next, 2));
}
