#include <cstdio>
void my_swap(int& a,int& b){
  a = a + b;
  b = a - b;
  a = a - b;
}

void descending_sort(int& a,int& b,int& c){
  if(a < b){
    my_swap(a,b);
  }
  if(a < c){
    my_swap(a,c);
  }
  if(b < c){
    my_swap(b,c);
  }
}

int main(int argc, char const* argv[])
{
  int a,b,c;
  scanf("%d%d%d",&a,&b,&c);
  

  descending_sort(a,b,c);
  //printf("After  a = %d , b = %d , c = %d\n",a,b,c);


  if(a * a == b * b + c * c)
    printf("Yes\n");
  else if(!(a > ((b-c) > 0 ? (b - c) : (c - b)) && a < (b + c))){
    printf("not a triangle\n");
  }else
    printf("No\n");
  return 0;
}
