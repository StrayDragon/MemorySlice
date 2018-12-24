#include<stdio.h>
#include<iostream>
using namespace std;
int main(){
int a[5] = {1, 2, 3, 4, 5};
int (*pa)[5] = &a;
int* paEle = a; // 相当于 &a[0]
printf("ptr array : %#x\n", pa);
printf("ptr first element : %#x\n", paEle);
printf("move one step (arr) : %#x\n", pa + 1);
printf("move one step (element) : %#x\n", paEle + 1);
printf("%d\n", sizeof(a));
printf("%d\n", sizeof(paEle));

printf("%#x ", &a+1); printf(" ?= ");printf(" %#x \n", a+1);
printf("%#x ",&a);printf(" ?= ");printf("%#x \n",a);
cout << (&a+1) << " ?= " << (a+1) << endl;
cout << (&a) << " ?= " << (a) << endl;
	return 0;
}
