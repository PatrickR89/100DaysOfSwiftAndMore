import UIKit

func divide(_ dividend: Int, _ divisor: Int) -> Int {

    if dividend == divisor { return 1 }

    let isPositive = (dividend < 0) == (divisor < 0)
    var newDivident: UInt32 = UInt32(abs(dividend))
    var newDivisor: UInt32 = UInt32(abs(divisor))
    var answer: UInt32 = 0

    while newDivident >= newDivisor {
        var power = 0

        while newDivident > (newDivisor << (power + 1)) {
            power += 1
        }

        answer += 1 << power
        newDivident -= newDivisor << power
    }

    if answer == (1 << 31) && isPositive {
        return Int(Int32.max)
    }

    return isPositive ? Int(answer) : -Int(answer)
}

divide(10, 3)
divide(7, -3)
divide(1, -1)
