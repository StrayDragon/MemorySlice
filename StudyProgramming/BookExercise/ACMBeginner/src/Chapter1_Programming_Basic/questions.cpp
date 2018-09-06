#include <cstdio>
#include <climits>
/**
 * q1:Max/Min value of Integer(int)
 */
void count_max_and_min_int_value(int& q1_max, int& q1_min){
  q1_max = INT_MAX;
  q1_min = INT_MIN;
}

/**
 * q2:Count double limits
 */
void count_double_limits(){
  float a = 3.14 * 3.14;
  double b = 3.14 * 3.14;

  printf("\t a : %f \n",a);
  printf("\t b: %lf",b);
}
int main(int argc, char const* argv[])
{
  int q1_max,q1_min;
  count_max_and_min_int_value(q1_max,q1_min);
  printf("q1:\t max: %d \n\t min: %d\n",q1_max,q1_min);
  printf("q2:");
  count_double_limits();
  printf("others see : https://en.cppreference.com/w/c/types/limits");
  return 0;
}
