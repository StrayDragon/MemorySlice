#include<iostream>

using namespace std;

void visit(int& a){
    cout << "visit() : " << a << endl;
}

int use_function_ptr(void (*p)(int&)){
    int a = 10;    
    p(a);
    cout << "use_function_ptr() : " << "ok" << endl;
    return a;
}

int main(){
    int receiver = use_function_ptr(visit);

    cout << receiver << endl;
    return 0;
}