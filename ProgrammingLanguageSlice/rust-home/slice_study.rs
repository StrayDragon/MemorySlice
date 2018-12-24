fn first_word(s: &str) -> &str {
	let bytes = s.as_bytes();

	for (i,&items) in bytes.iter().enumerate(){
		if items == b' ' {
			return &s[0..i];
		}
	}

	&s[..]
}


fn main(){
	let words = String::from("Hi Iloveyou!");

	println!("{}",first_word(&words[..]));
	
}
