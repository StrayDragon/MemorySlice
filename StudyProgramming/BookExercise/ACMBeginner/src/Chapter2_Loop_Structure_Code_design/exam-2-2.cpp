#include <cstdio>
// #include <iostream>

using namespace std;

int main(int argc, char const *argv[]) {
  bool is_ok = false;
  int a, b, c, n, i = 1;
  while (scanf("%d%d%d", &a, &b, &c) == 3) {
    // while (cin >> a >> b >> c) {
    for (n = 10; n < 100; n++) {
      if (n % 3 == a && n % 5 == b && n % 7 == c) {
        is_ok = true;
        break;
      }
    }
    if (is_ok)
      printf("Case %d: %d\n", i, n);
    else
      printf("Case %d: No answer\n", i);
    i++;
    is_ok = false;
  }
  return 0;
}
