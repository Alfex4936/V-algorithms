fn main() {
	test_arr := [1, 0, -3, 5, 99, -4]
	min, max := find_min_max(test_arr)
	println('$min and $max') // -4 and 99
}

fn find_min_max(array []int) (int, int) {
	mut min := array[0]
	mut max := array[0]
	for i in 0 .. array.len {
		if array[i] > max {
			max = array[i]
		}
		if array[i] < min {
			min = array[i]
		}
	}
	return min, max
}
