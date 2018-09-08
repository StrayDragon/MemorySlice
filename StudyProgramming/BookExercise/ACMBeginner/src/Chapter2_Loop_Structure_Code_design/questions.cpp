#include <iostream>

using namespace std;

int main(int argc, char const *argv[]) {
  int n;
  scanf("%d", &n);

  puts("Question 1:");
  printf("Origin:");
  for (int i = 0; i < n; i++) {  //#6
    printf("%d ", i);            //#7
  }
  putchar('\n');

  printf("mission 1:");
  for (int i = 0; i < n; i++) {
    printf("%d ", i++);
  }
  putchar('\n');

  printf("mission 2:");
  for (int i = 0; i < n; i += 2) {
    printf("%d ", i);
  }
  putchar('\n');

  puts("Question 2:");
  double ii;

  for (ii = 0; ii < 10; ii += 0.1) {
    printf("%.lf ", ii);
  }
  putchar('\n');

  for (ii = 0; ii < 10; ii += 0.1) {
    printf("%lf ", ii);
  }
  putchar('\n');

  return 0;
}
