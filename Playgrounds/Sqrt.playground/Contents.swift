import UIKit

func mySqrt(_ x: Int) -> Int {
    var num = x

    while num*num > x {
        num = (num + x/num)/2
    }

    return num
    }

mySqrt(4)
mySqrt(8)
mySqrt(25)
mySqrt(141)

