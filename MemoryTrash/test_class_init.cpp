#include<iostream>
using namespace std;

class B{
  public:
	B(){
		cout << "B: B()" << endl;
	}  
	void bmf(){
		cout << "B: bmf()" << endl;
		bvmf();
	}
  private:
	virtual void bvmf(){
		cout << "B: bvmf()" << endl;
		cout << "B::bvmf(): do something" << endl;
	}	
};

class D1 : public B{
  public:
	D1() : B(){
		cout << "D1: D1()" << endl;
	}  
	void bmf(){
		cout << "D1: bmf()" << endl;
		bvmf();
	}
  private:
	virtual void bvmf(){
		cout << "D1: bvmf()" << endl;
		cout << "D1::bvmf(): do something" << endl;
	}	
};

int main()
{
	B d1;
	d1.bmf();
	return 0;
}
