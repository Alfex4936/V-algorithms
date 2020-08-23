fn main() {
	test_arr := [3, 5, -9, 1, 3, -2, 3, 4, 7, 2, -9, 6, 3, 1, -5, 4]
	result := kadane(test_arr)
	println(result) // 19
}

// Maximum subarray problem
fn kadane(array []int) int {
	mut result := array[0]
	mut kadane_arr := array
	for i in 1 .. kadane_arr.len {
		kadane_arr[i] = max(kadane_arr[i], kadane_arr[i - 1] + array[i])
		if kadane_arr[i] > result {
			result = kadane_arr[i]
		}
	}
	return result
}

fn max(a, b int) int {
	if a > b {
		return a
	} else {
		return b
	}
}
