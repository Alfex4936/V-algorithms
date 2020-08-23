fn main() {
	test_num := 123456789
	sum := sum_digits(test_num)
	println(sum) // 45
}

fn sum_digits(number int) int {
	mut n := number
	if n < 0 {
		n = -n
	}
	mut sum := 0
	for n > 0 {
		sum += n % 10
		n = n / 10
	}
	return sum
}
