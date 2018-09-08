#include <cstdio>

int main(int argc, char const *argv[]) {
  int a, b, c;
  int remainder = 0;  //余数
  int quotient = 0;   //商
  while ((scanf("%d%d%d", &a, &b, &c) != EOF) && a != 0 && b != 0 && c != 0) {
    //变量条件检查省略
    quotient = a / b;
    remainder = a % b;
    printf("%d.", quotient);

    for (int i = 1; i <= c; i++) {
      if ((i < c) && (c != 1))  // special case 一位
        printf("%d", remainder * 10 / b);
      else {
        if ((remainder * 10 / b) < 5)  //四舍五入
          printf("%d", (remainder * 10) / b);
        else
          printf("%d", (remainder * 10) / b + 1);
      }
      remainder = remainder * 10 % b;
    }
  }
  return 0;
}
