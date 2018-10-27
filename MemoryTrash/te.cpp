#include<iostream>
#include<iterator>
#include<vector>
#include<algorithm>

using namespace std;

int main(){
	vector<int> vi{1,2,3,4,5,6};
	int* arr = new int[vi.size()];

	int i = 0;
	for(auto& e : vi){
		arr[i++] = e;
	}
	for(int i = 0; i < vi.size() ; i++)
		cout << arr[i] << " "; 
	cout << endl;
	return 0;
}
