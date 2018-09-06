#include <cstdio>

int main(int argc, char const* argv[])
{
  const int PRICE = 95;

  int n;
  scanf("%d",&n);
  
  double money = n * PRICE;

  if( money > 300){
    money *= 0.85;
  }

  printf("%.2lf",money);

  return 0;
}
