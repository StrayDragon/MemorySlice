#include<stdio.h>
#define Max 10
const int cMax = 10;
typedef struct tmp{
	int a;
	int b;
}tarr[Max];

int main(){
	int arr[Max]={0};
	printf("%d\n",arr[0]);

	tarr aa = {0};

	printf("%d %d\n",aa->a,aa->b);
	return 0;
}
