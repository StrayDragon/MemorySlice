#include<iostream>

template <typename... Ts>
constexpr int sum(Ts... args){
	return (0 + ... + args);
}

int main(){
	constexpr int s = sum(100);
	std::cout << "sum(100) : " 
						<< s
						<< std::endl;
	return 0;
}
