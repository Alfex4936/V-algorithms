fn main() {
	assert is_palindrome('aaa') == true
	assert is_palindrome('cacab') == false
	assert is_palindrome('aaa_bbb_aaa') == true
}

fn is_palindrome(str string) bool {
	mut start := 0
	mut end := str.len - 1
	for start < end {
		if str[start] == str[end] {
			start++
			end--
		} else {
			return false
		}
	}
	return true
}
