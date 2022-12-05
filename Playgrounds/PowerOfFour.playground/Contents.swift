import UIKit

func isPowerOfFour(_ n: Int) -> Bool {

    let greaterThanZero = n > 0
    let isPowerOfTwo = n & ( n - 1 ) == 0 // only pow of two & value smaller for one return 0
    let isNotPowerOfTwo = n & (0x55555555) == n // 01010101 -> only if bits are in odd positions number is power of four not two

    return greaterThanZero && isPowerOfTwo && isNotPowerOfTwo
    }

isPowerOfFour(4)
isPowerOfFour(16)
isPowerOfFour(7363)
isPowerOfFour(16384)
isPowerOfFour(2)
isPowerOfFour(32)
isPowerOfFour(64)
