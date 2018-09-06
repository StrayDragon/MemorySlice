#include <cstdio>
int main(int argc, char const* argv[])
{
  float f;
  scanf("%f",&f);
  printf("%.3lf",5 * (f - 32) / 9);
  return 0;
}
