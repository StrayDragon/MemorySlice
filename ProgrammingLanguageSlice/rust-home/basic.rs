fn basic_control_and_builtin_structures() {
	let mut tmp = 10;
	if tmp == 10 {
		println!("{}",tmp);
	}
	loop {
		if tmp == 12 { break; }
		else { tmp += 1; }
		println!("{}",tmp);
	}
	while tmp <= 15 {
		println!("{}",tmp);
		tmp += 1;
	}
	let arr = [1,2,3,];
	for tmp in arr.iter() { // #1: mask the outer 'tmp'
		println!("{}",tmp);
	}
	println!("{}",tmp);	// oh yes. see #1
	for r in (1..4).rev() {
		println!("{}",r);
	}
}

fn scope(){// s 此位置无效: 还未创建
	let s = "hello";// s 此位置起: 创建了字符串字面量
	println!("[栈]使用了字面量 s:{}",s);

	let mut s = String::from("hello");
	s.push_str(", world!");
	println!("[堆]使用了String::from()创建的对象 s:{}",s);

}// 此作用域已结束,s 不再有效

fn swap_vars_data(){
	// 5(简单值/缓存值) 是一个放在栈中的值,故x,y都可以打印
	let x = 5;println!("创建了x \t\t x:{}",x); 
	let y = x;println!("let y = x(复制) \t y:{}",y);
	println!("此时的x:{}\n",x);

	//String对象 是一个放在堆中的值,这里有了所有权转移的概念
	let s1 = String::from("hello");println!("创建了s1 \t\t\t s1:{}",s1);
	let s2 = s1; //move semantic
	println!("let s2 = s1(所有权转移) \t s2:{}",s2);
	//X println!("此时的s1:{}",s1); // ERROR: move occurs
	
	let s1 = String::from("hello");println!("创建了s1 \t\t\t s1:{}",s1);
	let s2 = s1.clone(); //copy semantic
	println!("let s2 = s1.clone()(复制) \t s2:{}",s2);
	println!("此时的s1:{}",s1); //ok

	let s = String::from("hello");
	takes_ownership(s); // move semantic
	makes_copy(x);	//copy semantic
	//X println!("{}",s) //move occurs
	println!("复制传函数所以可以访问 x:{}",x);

	let str = gives_ownership();
	println!("函数转移所有权 str:{}",str);
}

fn takes_ownership(str:String){
	println!("takes_ownership(s): {}",str);
}

fn makes_copy(x:i32){
	println!("makes_copy(x): {}",x);
}

fn gives_ownership() -> String{
	let str = String::from("hello");
	str
}

fn return_vars(s:&String) -> (&String,usize){
	(&s,s.len())
}

fn borrow_semantic(s:&String) -> usize{
	s.len()
}

fn basic_ownership(){
	//scope();
	swap_vars_data();
}

fn main() {
	// basic_control_and_builtin_structures();
	basic_ownership();
}
