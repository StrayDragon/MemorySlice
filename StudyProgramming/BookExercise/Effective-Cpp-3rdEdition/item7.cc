#include<iostream>

using namespace std;

class AWOV{
public:
	virtual ~AWOV() = 0;
};

AWOV::~AWOV() { }

class D1 : public AWOV{
public:
	D1() = default;
	~D1() = default;
};

int main(){
	D1 d1;

	return 0;
}
