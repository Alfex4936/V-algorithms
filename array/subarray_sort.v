/*
Subarray Sort

if array is [1, 2, 7, 4, 11, 10],

we have to sort from array[2] to array[5],

so we can have [1, 2, 4, 7, 10, 11]

return :
	[-1, -1] or [sortStart, sortEnd]
*/
fn main() {
	mut test_array1 := [1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19]
	mut test_array2 := [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
	mut test_array3 := [-41, 8, 7, 12, 11, 9, -1, 3, 9, 16, -15, 51, 7]
	assert subarray_sort(mut test_array1) == [3, 9]
	assert subarray_sort(mut test_array2) == [-1, -1]
	assert subarray_sort(mut test_array3) == [1, 12]
}

// O(n) Time | O(n) Space
// can possibly optimized to O(n) | O(1)
[direct_array_access]
fn subarray_sort(mut array []int) []int {
	mut array_origin := array[0..array.len].map(it)
	array.sort()
	mut stack := []int{}
	for i in 0 .. array.len {
		if array[i] != array_origin[i] {
			stack << i
		}
	}
	if stack.len != 0 {
		return [stack.first(), stack.last()]
	} else {
		return [-1, -1]
	}
}
