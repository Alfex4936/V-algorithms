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

    println('Random array : $test_arr')
    println('Random array length : $test_arr.len')
    
    sw := time.new_stopwatch({})
    heap_sort<int>(mut test_arr)  // Heap Sort
    println('Took : ${sw.elapsed().milliseconds()}ms')

    println('Result : $test_arr')
}

/*  Heap Sort
    Time Complexity O(nlogn) | Space Complexity O(1)
*/
fn heap_sort<T>(mut array []int) {
    n := array.len
    
    for i := n/2; i > -1; i-- {
        heapify(mut array, n, i)  // Max-heapify
    }
    
    for i := n - 1; i > 0; i-- {
        array[i], array[0] = array[0], array[i]
        heapify(mut array, i, 0)
    }
}


fn heapify(mut array []int, n int, i int) {
    mut largest := i
    left := 2 * i + 1
    right := 2 * i + 2

    if left < n && array[i] < array[left] {
        largest = left
    }

    if right < n && array[largest] < array[right] {
        largest = right
    }

    if largest != i {
        array[i], array[largest] = array[largest], array[i]
        heapify(mut array, n, largest)
    }
}