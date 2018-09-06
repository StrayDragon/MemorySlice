#include <cstdio>

int main(int argc, char const* argv[])
{
  int year;
  scanf("%d",&year);

  if(year % 4 == 0 && year % 100 != 0){
    printf("Leap Year.\n");
  }else{
    printf("No\n");
  }

  return 0;
}
