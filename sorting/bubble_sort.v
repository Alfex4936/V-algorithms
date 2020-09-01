import time
import rand

const (
	gen_len = 10_000 // how many random numbers to generate
	gen_max = 10_000 // max of the generated numbers
)

fn main() {
	mut test_arr := []int{}
	for _ in 0..gen_len {
		test_arr << rand.int_in_range(-gen_max, gen_max)
	}
	println('Random array length : $test_arr.len')
	sw := time.new_stopwatch({})
	bubble_sort(mut test_arr)
	println('Took : ${sw.elapsed().milliseconds()}ms')
	println('Result : $test_arr')
}


// Bubble Sort
[direct_array_access]
fn bubble_sort(mut array []int) {
	for i in 0..array.len {
		for j in 0..array.len - 1 - i {
			if array[j] > array[j + 1] {
				array[j], array[j + 1] = array[j + 1], array[j]
			}
		}
	}
	// println('${array[i]}')
}

