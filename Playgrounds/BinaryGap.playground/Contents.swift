import UIKit

func binaryGap(_ n: Int) -> Int {

    var n = n
    var gapCounter = 1
    var currentCounter = 1
    var binaryCounter = n.bitWidth - n.leadingZeroBitCount
    var isCounting = false
    if n.nonzeroBitCount <= 1 {
        return 0
    }

    while binaryCounter > 0 {
        if n & 1 == 1 {
            currentCounter = 1
            isCounting = true
        } else if n & 1 == 0 && isCounting {
            currentCounter += 1
            gapCounter = max(gapCounter, currentCounter)
        }

        n = n >> 1
        binaryCounter -= 1
    }

    return gapCounter
}

binaryGap(22)
binaryGap(8)
binaryGap(5)
