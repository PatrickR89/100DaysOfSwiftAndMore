import UIKit

func hasAlternatingBits(_ n: Int) -> Bool {

    var hasAlternatingBits = true
    var counter = Int32.bitWidth - Int32(n).leadingZeroBitCount
    var num = Int32(n)
    var lastBit = 2

    while hasAlternatingBits && counter > 0 {

        var currBit = 2

        if num & 1 == 1 {
            currBit = 1
        } else {
            currBit = 0
        }

        if (currBit == lastBit) {
            hasAlternatingBits = false
        }
        
        print(currBit)

        num = num >> 1

        lastBit = currBit

        counter -= 1
    }


    return hasAlternatingBits
}

hasAlternatingBits(5)
hasAlternatingBits(7)
hasAlternatingBits(11)
