#include<iostream>
#include<string>

using namespace std;


template<typename T>
class NamedObject{
public:
	NamedObject(std::string& name,const T& value);

private:
	std::string& nameValue;
	const T objectValue;
};

int main(){
	string newDog("Paul");
	string oldDog("Sac");

	NamedObject<int> p(newDog,2);
	NamedObject<int> q(oldDog,35);

	p = q;
	return 0;
}
