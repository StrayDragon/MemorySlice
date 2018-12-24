fn main() {
	let mut s = String::from("Hello");

	change(&mut s); // 借用语义

	println!("{}",s);
}

fn change(s: &mut String){
	s.push_str(" world~");
}
