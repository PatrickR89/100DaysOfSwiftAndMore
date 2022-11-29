import UIKit

func isPowerOfTwo(_ n: Int) -> Bool {

    if n <= 0 { return false }
    if n == 1 { return true }

    var temp = n

    while temp > 1{
        print(temp)
        if temp % 2 != 0 { return false }

        temp = temp / 2
    }

    return true
}

isPowerOfTwo(1)
isPowerOfTwo(16)
isPowerOfTwo(3)
isPowerOfTwo(6)
isPowerOfTwo(2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2)
isPowerOfTwo(2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2*2 + 2)

