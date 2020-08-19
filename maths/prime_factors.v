fn main() {
    test_num := 72

    result := prime_factor(test_num)
    println(result)  // 2 × 2 × 2 × 3 × 3
}

fn prime_factor(number int) []int {
    mut n := number
    mut result := []int{}
    mut i := 2

    for i * i <= n {
        if n % i > 0 {
            i++
        } else {
            n /= i
            result << i
        }
    }

    if n > 1 {
        result << n
    }

    return result
}