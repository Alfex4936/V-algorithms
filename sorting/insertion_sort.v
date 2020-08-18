import time
import rand

const (
	gen_len = 5_000 // how many random numbers to generate
	gen_max = 5_000 // max of the generated numbers
)

fn main() {
	mut test_arr := []int{}
	for _ in 0..gen_len {
		test_arr << rand.int_in_range(-gen_max, gen_max)
	}
	println('Random array length : $test_arr.len')
	sw := time.new_stopwatch({})
	insertion_sort<int>(mut test_arr)
	println('Took : ${sw.elapsed().milliseconds()}ms')
	println('Result : $test_arr')
}

/* Insertion Sort
	Best O(n) Time | O(1) Space
	Average O(n^2) Time | O(1) Space
	Worst (On^2) Time | O(1) Space
*/
fn insertion_sort<T>(mut array []int) {
	for i in 1..array.len {  // range(1, len(array))
		key := array[i]

		mut j := i - 1
		for j >= 0 && key < array[j] {
			array[j + 1] = array[j]
			j--
		}
		array[j + 1] = key
	}
	// println('${array[i]}')
}

