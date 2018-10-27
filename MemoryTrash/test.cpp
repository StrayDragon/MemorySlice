#include<iostream>
inline int powExcludePower0(int base, int power) {
  int sum = 1;
  for (int i = 0; i < power; ++i) sum *= base;
  return sum;
}
inline int countSpecificDigitOfNumber(int target, int digit) {
  if (digit == 1 || digit == 0) {
    return target % 10 / 1;
  } else {
    return target % (powExcludePower0(10, digit)) /
           (powExcludePower0(10, digit - 1));
  }
}
using namespace std;

int main(){
	int target = 1234;
	int digits = 4;
	for(int mod_weight = 10,divisor = 1,i = 1; i <=  digits; i++,mod_weight *= 10,divisor *= 10){
		cout << target % mod_weight / divisor << endl;
	}
	cout << countSpecificDigitOfNumber(1234,1) << endl;
	cout << countSpecificDigitOfNumber(1234,2) << endl;
	cout << countSpecificDigitOfNumber(1234,3) << endl;
	cout << countSpecificDigitOfNumber(1234,5) << endl;
	return 0;
}
