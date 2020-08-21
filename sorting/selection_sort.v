import time
import rand

const (
    gen_len = 5000 // how many random numbers to generate
    gen_max = 5000 // max of the generated numbers
)


fn main() {
    mut test_arr := []int{}

    for _ in 0..gen_len {
        test_arr << rand.int_in_range(-gen_max, gen_max)
    }

    println('Random array length : $test_arr.len')

    // Selection Sort
    sw := time.new_stopwatch({})
    selection_sort(mut test_arr)
    println('Took : ${sw.elapsed().milliseconds()}ms')

    println('Result : $test_arr')
}

/*  Selection Sort
    All : O(n^2) Time | O(1) Space
*/
fn selection_sort(mut array []int) {
    mut current_idx := 0
    for current_idx < array.len - 1 {
        mut smallest_idx := current_idx
        for i in current_idx + 1..array.len {
            if array[smallest_idx] > array[i] {
                smallest_idx = i
            }
        }
        array[current_idx], array[smallest_idx] = array[smallest_idx], array[current_idx]
        current_idx++
    }
}
