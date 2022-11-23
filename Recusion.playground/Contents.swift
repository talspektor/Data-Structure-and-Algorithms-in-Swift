
func factorial(number: Int) -> Int {
    
    // base case
    if number == 0 {
        return 1
    }
    
    // recursive case
    return number * factorial(number: number - 1)
}

let result = factorial(number: 6)
print(result)

/*
    Stack
    2 * 4 = 8
    2 * power(2,2) = 4
    2 * power(2,1) = 2
    2 * power(2,0) = 1
 
 */

func power(number: Int, n: Int) -> Int {
    
    // base case
    if n == 0 {
        return 1
    } else {
        return number * power(number: number, n: n - 1)
    }
}

let pow = power(number: 2, n: 3)
print(pow)
