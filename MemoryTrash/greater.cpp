#include<iostream>
#include<functional>
#include<vector>

using namespace std;

template<class T,class Compare=std::greater<T>>
class A{
	Compare comp;
public:
	bool g(){
		return true;
	}

	bool f(int a,int b){
		return comp(a,b);
	}
};

int main(){
	A<int> a;
	cout << boolalpha << a.f(1,2) <<  endl << a.f(3,2) <<  endl;
	A<int,less<int>> b;
	cout << boolalpha << b.f(1,2) <<  endl << b.f(3,2) <<  endl;
	return 0;
}
