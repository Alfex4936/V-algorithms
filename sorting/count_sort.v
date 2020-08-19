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
	min, mut max := find_min_max(mut test_arr)
	count_sort<int>(mut test_arr, min, max - min)

	println('Took : ${sw.elapsed().microseconds()}μs')
	println('Result : $test_arr')
}

/*  Count Sort
	All: O(n) Time | O(n) Space
*/
fn count_sort<T>(mut array []int, min int, max int) {

	mut buckets := []int{ len: max + 1, init: 0 }
	// equivalent to [0 for _ in range(max + 1)]
	

	for number in 0..array.len {
		buckets[array[number] - min]++
	}
	/* didn't work
	for number in array {
		buckets[number-min]++
	}
	*/
	
	mut index := 0

	for i in 0..buckets.len {
		for buckets[i] > 0 {
			array[index] = i + min
			index++
			buckets[i]--
		}
	}
}


fn find_min_max(mut array []int) (int, int) {
	mut min := array[0]
	mut max := array[0]

	for i in 0..array.len {
		if array[i] > max {
			max = array[i]
		}

		if array[i] < min {
			min = array[i]
		}
	}
	return min, max
}