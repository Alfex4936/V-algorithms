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

    println('Random array : $test_arr')
    println('Random array length : $test_arr.len')
    
    sw := time.new_stopwatch({})
    quick_sort(mut test_arr, 0, test_arr.len - 1)  // Heap Sort
    println('Took : ${sw.elapsed().milliseconds()}ms')

    println('Result : $test_arr')
}

/*  Quick Sort
    Best : O(nlogn) Time | O(logn) Space
    Average : O(nlogn) Time | O(logn) Space
    Worst : O(n^2) Time | O(logn) Space
*/
fn quick_sort(mut array []int, left int, right int) {
    if left < right {
        p := partition(mut array, left, right)
        quick_sort(mut array, left, p - 1)
        quick_sort(mut array, p + 1, right)
    }
}

// Lomuto's partition scheme
fn partition(mut array []int, low int, high int) int {
    pivot_index := rand.int_in_range(low, high)
    pivot := array[pivot_index]

    array[pivot_index], array[high] = array[high], array[pivot_index]

    mut index := low

    for i in low..high {
        if array[i] < pivot {
            array[i], array[index] = array[index], array[i]
            index++
        }
    }
    
    array[high], array[index] = array[index], array[high]

    return index
}