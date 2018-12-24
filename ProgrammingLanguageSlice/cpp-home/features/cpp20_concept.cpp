#include <string>
#include <locale>
using namespace std::literals;
 
// 概念 "EqualityComparable" 的声明，任何有该类型值 a 和 b ，
// 而表达式 a==b 可编译而其结果可转换为 bool 的 T 类型满足它
template<typename T>
concept bool EqualityComparable = requires(T a, T b) {
    { a == b } -> bool;
};
 
//void f(EqualityComparable&&); // 有制约函数模板的声明
template<typename T>
void f(T&&) requires EqualityComparable<T>{// 相同的长形式
	static_assert(1 == 1,"Here");	
}

int main() {
  f("abc"s); // OK ： std::string 为 EqualityComparable
  //f(std::use_facet<std::ctype<char>>(std::locale{})); // 错误：非 EqualityComparable 
}

//void f(EqualityComparable&& e){

//}
