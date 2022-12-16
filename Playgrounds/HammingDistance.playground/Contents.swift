import UIKit

func hammingDistance(_ x: Int, _ y: Int) -> Int {

    var x = Int32(x)
    var y = Int32(y)
    var counter = x.bitWidth
    var distance = 0

    while counter > 0 {
        if x & 1 != y & 1 {
            distance += 1
        }

        x = x >> 1
        y = y >> 1
        counter -= 1
    }

    return distance
    }

hammingDistance(1, 4)
hammingDistance(3435, 34534)
hammingDistance(3, 1)
