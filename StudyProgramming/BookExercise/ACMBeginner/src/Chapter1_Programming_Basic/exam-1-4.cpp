#include <cstdio>
#include <cmath>
#include <cassert>
  
int main(int argc, char const* argv[])
{
  int n;
  scanf("%d",&n);
  assert(!(n > 360 && n < 0));

  printf("sin:%.3lf cos :%.3lf\n",sin((double)n),cos((double)n));
  return 0;
}
