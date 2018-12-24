#include<bits/stdc++.h>

class Integer{
	std::int32_t i_ = 0;
public:
	Integer() = default;
	Integer(long long i) :i_(i){}
	std::int32_t getI() const { return i_; }
	void setI(long long i) { i_ = static_cast<std::int32_t>(i); }
};

std::ostream& operator<<(std::ostream& os,const Integer& i){
	return os << i.getI();
}

template<typename T>
void guideToInteger(T arr,int len){
	static_assert(std::is_base_of<std::array<Integer,10>,T>::value,"请传入Integer子类!");
	std::cout << arr[0] << '\n';
}


int main(){
	std::array<Integer,10> arr;
	guideToInteger(arr,10);

}
