#include <iostream>
#include <set>

class S;
std::set<S*> m;

using namespace std;

class S{
public:
	S(){ m.insert(this); }
	S(S&&){ m.insert(this); }
	virtual ~S(){
		m.erase(this);
	}
};


void clearAll(){
	for(auto p : m){
cout << "here \n" << p << endl;
		if(p) delete p;
		m.clear();
cout << "end here" << endl;		
	}
}

ostream& operator<<(ostream& out,set<S*> s){
	for(auto _ : s){
		out << _ << " ";
	}
	return out;
}

int main(){
	S *s1 = new S(),*s2 = new S(),*s3 = new S();
	cout << m << endl;
	clearAll();
	//delete s1;
	//delete s2;
	//delete s3;
	cout << "END" << endl;
}
