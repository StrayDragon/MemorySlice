#include<iostream>

using namespace std;

class BitMap{
public:
	BitMap() = default;
	~BitMap() = default;
};

class Widget{
public:
	Widget() = default;

	//Widget(const Widget& w);
	//version 1 : bad
	/*
	Widget& operator=(const Widget& rhs){
		delete pb;
		pb = new BitMap(*rhs.pb); //SF!
		return *this;
	}
	*/
	
	//version 2 : exception leak
	/*
	Widget& operator=(const Widget& rhs){
		if(this == &rhs) return *this;
		delete pb;
		pb = new BitMap(*rhs.pb);
		return *this;
	}
	*/

	//version 3 : exception safe but SF! 
	/*
	Widget& operator=(const Widget& rhs){
		BitMap* pOld = pb;
		pb = new BitMap(*rhs.pb);
		delete pOld;
		return *this;
	}
	*/

	

private:
	BitMap* pb;
};


int main(){
	Widget w;
	w = w;
	return 0;
}
