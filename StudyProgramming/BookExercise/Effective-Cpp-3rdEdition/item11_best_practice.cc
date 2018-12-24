#include<iostream>
#include<algorithm>

using namespace std;

class BitMap{
public:
	BitMap() = default;
	~BitMap() = default;
};

class Widget{
public:
	Widget() = default;

	void swap(Widget& rhs){
		std::swap(*this,rhs);
	}

	Widget& operator=(Widget rhs){ //Copy and assignment
		std::swap(pb,rhs.pb);
		return *this;
	}

private:
	BitMap* pb;
};


int main(){
	Widget w;
	w = w;
	return 0;
}
