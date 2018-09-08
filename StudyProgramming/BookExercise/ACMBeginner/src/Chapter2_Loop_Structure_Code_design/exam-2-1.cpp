#include <cstdio>
#include <cmath>
using namespace std;

int main(int argc, char const *argv[])
{
  int sum = 0,daffodil_copy = 0;
  for(int daffodil = 100 ; daffodil <= 999 ; ++daffodil ){
    daffodil_copy = daffodil;
    while(daffodil_copy != 0){
      sum += pow(daffodil_copy % 10, 3);
      daffodil_copy /= 10;
    }
    if(sum == daffodil){
      printf("%d ",daffodil);
    }
    sum = 0;
  }
  putchar('\n');
  return 0;
}
