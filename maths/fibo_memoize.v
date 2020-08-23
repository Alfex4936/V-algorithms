fn main() {
	// map[int]int not supported yet
	mut memoize := {
		'1': 0
		'2': 1
	}
	println(get_n_fibo(18, mut memoize))
	println(memoize)
}

fn get_n_fibo(n int, mut memo map[string]int) int {
	if n.str() in memo {
		return memo[n.str()]
	} else {
		memo[n.str()] = get_n_fibo(n - 1, mut memo) + get_n_fibo(n - 2, mut memo)
		return memo[n.str()]
	}
}
