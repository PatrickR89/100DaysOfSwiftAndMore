import UIKit

func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {

    var result = 0

    for num in left...right {
        if isPrimeNum(num.nonzeroBitCount) {
            result += 1
        }
    }

    return result
}

func isPrimeNum(_ num: Int) -> Bool {

    if num == 0 || num == 1 {
        return false
    }

    for divider in 2..<num {
        if num % divider == 0 {
            return false
        }
    }

    return true
}

countPrimeSetBits(6, 10)
countPrimeSetBits(10, 15)
