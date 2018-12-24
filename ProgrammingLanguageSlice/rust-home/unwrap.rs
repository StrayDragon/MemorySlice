use std::fs::File;

fn main(){
	#[warn(unused_variables)]
	let _f = File::open("non-exist")
									//.unwrap()
									.expect("打开失败!");
}
