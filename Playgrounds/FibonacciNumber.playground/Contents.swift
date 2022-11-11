import UIKit


func fib(_ n: Int) -> Int {
    var fibonacci = [0, 1]

    if n > 1 {
        for i in 2...n {
            fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
        }
    }

    return fibonacci[n]
}

fib(1)
fib(2)
fib(3)
fib(4)
fib(5)
fib(10)
fib(25)
fib(50)
fib(92)
