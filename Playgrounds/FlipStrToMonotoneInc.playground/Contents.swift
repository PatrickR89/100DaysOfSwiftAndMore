import UIKit

func minFlipsMonoIncr(_ s: String) -> Int {

    let s = Array(s)

    var ones = 0
    var zeros = 0

    print(s)

    s.forEach {
        switch $0 {
        case "1":
            ones += 1
        default:
            zeros += 1
            zeros = min(ones, zeros)
        }
    }

    return min(ones, zeros)
}

minFlipsMonoIncr("00110")
minFlipsMonoIncr("010110")
minFlipsMonoIncr("00011000")
minFlipsMonoIncr("10011111110010111011")
minFlipsMonoIncr("0101100011")
