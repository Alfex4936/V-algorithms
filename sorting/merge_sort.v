import time
import rand

const (
	gen_len = 10000 // how many random numbers to generate
	gen_max = 10000 // max of the generated numbers
)

fn main() {
	mut test_arr := []int{}
	for _ in 0..gen_len {
		test_arr << rand.int_in_range(-gen_max, gen_max)
	}

	println('Random array : $test_arr')
    println('Random array length : $test_arr.len')

	sw := time.new_stopwatch({})
	merge_sort(mut test_arr, 0, test_arr.len - 1)
	println('Took : ${sw.elapsed().milliseconds()}ms')

	println('Result : $test_arr')
}


/*	Merge Sort
	All : O(nlogn) Time | O(n) Space
*/
fn merge_sort(mut array []int, start int, end int) {
	if start < end {
		mid := (start + end) / 2
		merge_sort(mut array, start, mid)
		merge_sort(mut array, mid + 1, end)
		merge(mut array, start, mid, end)
	}
}

fn merge(mut array []int, start int, mid int, end int) {
	mut i := start
	mut j := mid + 1
	mut k := start

	mut sorted := []int{ len: array.len, init : 0}

	for i <= mid && j <= end {
		if array[i] <= array[j] {
			sorted[k++] = array[i++] 
		} else {
			sorted[k++] = array[j++]
		}
	}

	for i <= mid {
		sorted[k++] = array[i++]
	}
	for j <= end {
		sorted[k++] = array[j++]
	}

	for index in start..end + 1 {
		array[index] = sorted[index]
	}

}