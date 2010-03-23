#include <stdlib.h>
#include <stdio.h>

int square(int x) {
  return x * x;
}

int max(int x, int y) {
  if ( x > y ) return x;
  else return y;
}

int max_sum_of_squares(int a, int b, int c) {
  if ( a > b ) return square(a) + square(max(b, c));
  else return square(b) + square(max(a, c));
}

int main(int argc, const char* argv[]) {
  printf("max sum of squares %i\n", max_sum_of_squares(3, 4, 5));
}
