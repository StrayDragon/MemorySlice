#include<iostream>
using namespace std;

[[deprecated]]
void f(){
	cout << "f()" << endl;
}

[[deprecated("g()已被废弃啦!")]]
void g(){
	cout << "f()" << endl;
}
int main(){
	f();
	g();
	return 0;
}
