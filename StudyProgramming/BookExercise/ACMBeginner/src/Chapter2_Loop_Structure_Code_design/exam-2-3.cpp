#include <cstdio>
#include <iostream>

using namespace std;

int main(int argc, char const *argv[]) {
  int n;
  cin >> n;
  if (n > 0 && n <= 20) {
    for (int space_num = 0; space_num < n; ++space_num) {
      for (int i = 0; i < space_num; i++) {
        putchar(' ');
      }
      for (int symbol_num = (n - space_num) * 2 - 1; symbol_num > 0;
           --symbol_num) {
        putchar('#');
      }
      for (int i = 0; i < space_num; i++) {
        putchar(' ');
      }
      putchar('\n');
    }
  }
  return 0;
}
