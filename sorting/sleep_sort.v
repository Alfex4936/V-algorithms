import time
import sync

// Sleep Sort is time-based sorting technique.
fn main() {
	mut wg := sync.new_waitgroup()
	test_arr := [3, 2, 1, 4, 1]
	wg.add(test_arr.len)
	for i, value in test_arr {
		go sort(i, value, mut wg)
	}
	wg.wait()
	println('Printed sorted array')
	/*
	1
	1
	2
	3
	4
	*/
}

// function in `go` statement cannot contain mutable non-reference arguments
fn sort(id, value int, mut wg sync.WaitGroup) {
	time.sleep(value)
	println(value)
	wg.done()
}
