import time
import rand
import math

const (
    gen_len = 10000 // how many random numbers to generate
    gen_max = 10000 // max of the generated numbers
)


fn main() {
    mut test_arr := []int{}

    for _ in 0..gen_len {
        test_arr << rand.int_in_range(-gen_max, gen_max)
    }

    println('Random array length : $test_arr.len')

    // Introspective Sort
    sw := time.new_stopwatch({})
    mut max_depth := 2 * (math.log2(test_arr.len) - 1)
    threshold := 16
    introsort_helper(mut test_arr, 0, test_arr.len, threshold, int(max_depth))

    println('Took : ${sw.elapsed().milliseconds()}ms')

    println('Result : $test_arr')
}

// Time Complexity O(nlogn) | Space Complexity O(logn) | not stable
[direct_array_access]
fn introsort_helper(mut array []int, start int, end_ int, threshold int, max_depth_ int) {
    mut max_depth := max_depth_
    mut end := end_

    for end - start > threshold {
        if max_depth == 0 {
            heap_sort(mut array)
        }
        max_depth--

        median := median_of_three(mut array, start, start + ((end - start) / 2) + 1, end - 1)
        p := partition(mut array, start, end, median)
        introsort_helper(mut array, p, end, threshold, max_depth)
        end = p
    }
    insertion_sort(mut array, start, end)
}

[direct_array_access]
fn partition(mut array []int, low int, high int, pivot int) int {
    mut i := low
    mut j := high
    for true {
        for array[i] < pivot {
            i++
        }
        j--
        for pivot < array[j] {
            j--
        }
        if i>= j {
            return i
        }
        array[i], array[j] = array[j], array[i]
        i++
    }
    return i
}

fn median_of_three(mut array []int, lowIdx int, midIdx int, highIdx int) int {
    if (array[lowIdx] - array[midIdx]) * (array[highIdx] - array[lowIdx]) >= 0{
        return array[lowIdx]
    }
    else if (array[midIdx] - array[lowIdx]) * (array[highIdx] - array[midIdx]) >= 0{
        return array[midIdx]
    }
    else {
        return array[highIdx]
    }    
}

/* 	Insertion Sort
    Best O(n) Time | O(1) Space
    Average O(n^2) Time | O(1) Space
    Worst (On^2) Time | O(1) Space
*/
[direct_array_access]
fn insertion_sort(mut array []int, start int, end int) {
    for i in start..end {  // range(1, len(array))
        mut j := i
        key := array[i]

        for j != start && array[j - 1] > key {
            array[j] = array[j - 1]
            j--
        }
        array[j] = key
    }
}

/*  Heap Sort
    Time Complexity O(nlogn) | Space Complexity O(1)
*/
[direct_array_access]
fn heap_sort(mut array []int) {
    n := array.len
    
    for i := n/2; i > -1; i-- {
        heapify(mut array, n, i)  // Max-heapify
    }
    
    for i := n - 1; i > 0; i-- {
        array[i], array[0] = array[0], array[i]
        heapify(mut array, i, 0)
    }
}

[direct_array_access]
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