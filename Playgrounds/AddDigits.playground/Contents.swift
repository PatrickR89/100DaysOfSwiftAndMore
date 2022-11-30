import UIKit

func addDigits(_ num: Int) -> Int {

    if num == 0 {
        return 0
    }

    var remainder = num % 9
    print(remainder)

    if remainder == 0 {
        return 9
    } else {
        return remainder
    }
}

addDigits(38)
addDigits(0)
addDigits(1)
