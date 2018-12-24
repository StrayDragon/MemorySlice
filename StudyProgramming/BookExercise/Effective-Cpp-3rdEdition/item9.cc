#include<iostream>

using namespace std;

class Transaction{
public:
	Transaction();
	virtual void logIt() const = 0;
};

Transaction::Transaction(){
	logIt();
}

class Buy : public Transaction{
public:
	void logIt() const override;
};

void Buy::logIt() const {
	cout << "Buy::logIt()" << endl;
}

int main(){
	Buy b;
	
	return 0;
}
