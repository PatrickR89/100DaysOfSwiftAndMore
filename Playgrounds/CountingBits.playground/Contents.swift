import UIKit

func countBits(_ n: Int) -> [Int] {

    var i  = n
    var answ = [Int]()

    while i >= 0 {

        var counter = 0
        var bitCount = 0
        var tempValue = i

        while counter < 32 {
            bitCount += tempValue & 1
            tempValue = tempValue >> 1
            counter += 1
        }

        answ.append(bitCount)
        i -= 1
    }

    return answ.reversed()
}

countBits(2)
countBits(5)
