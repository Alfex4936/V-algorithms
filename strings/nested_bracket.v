fn main() {
	assert is_balanced('()()(([]))') == true
	assert is_balanced('()()(([))') == false
	assert is_balanced('[((([])([]){}){}){}([])[]((())') == false
}

fn is_balanced(brackets string) bool {
	opening := '([{'
	closing := ')]}'
	matches := {
		')': '('
		']': '['
		'}': '{'
	}
	mut stack := []string{}
	for bracket_ in brackets {
		bracket := bracket_.str() // bracket_ is byte
		if bracket in opening {
			stack << bracket
		} else if bracket in closing {
			if stack.len == 0 {
				return false
			} else if stack.last() == matches[bracket] {
				stack.pop()
			} else {
				return false
			}
		}
	}
	return stack.len == 0
}
