#include <stdlib.h>
#include <stdio.h>

#define true 1

void print_row(int row[]) {
  int i;

  printf("row: ");
  for (i = 0; row[i] != 0; i++ ) printf("%i ", row[i]);
  printf("\n");
}

void pascal_row(int row[], int rows) {
  int curr_row, i, prev = 1, cell;

  for (curr_row = 0; curr_row < rows; curr_row++) {
    for (i = 0; i <= curr_row; i++) {
      cell = prev + row[i];
      prev = row[i];
      row[i] = cell;
    }
    print_row(row);
  }
}

int main(int argc, const char* argv[]) {
  int i, row[100] = {0};
  pascal_row(row, 20);
}
