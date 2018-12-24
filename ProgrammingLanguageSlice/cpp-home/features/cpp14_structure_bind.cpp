#include<iostream>
#include<vector>
#include<utility>
using namespace std;

int main(){
	pair<int,int> pii{1,3};
	auto [a,b] = pii;
	cout << "before: " << a << " " << b << endl;

	return 0;
}
