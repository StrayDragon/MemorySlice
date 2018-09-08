#include <cstdio>

int main(int argc, char const *argv[]) {
  double n, m;
  double sum = 0;
  while ((scanf("%lf%lf", &n, &m) != EOF) && !(n == 0 && m == 0)) {
    while (n <= m) {
      //陷阱  sum += 1 / n * n; 假设n = 2 , sum = 1
      sum += 1 / (n * n); //此式   n = 2 , sum = 0.25
      n++;
    }
    printf("Case 1: %.5lf\n", sum);
    sum = 0;
  }
  return 0;
}
