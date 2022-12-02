import UIKit

func firstBadVersion(_ n: Int) -> Int {

    var goodVersion = 0
    var badVersion = n

    while (badVersion - goodVersion > 1) {
        let midVersion = goodVersion + (badVersion - goodVersion) / 2

        if isBadVersion(midVersion) {
            badVersion = midVersion
        } else {
            goodVersion = midVersion
        }
    }

    return badVersion
}

func isBadVersion(_ n: Int) -> Bool {
    if n >= 44 { return true } else {return false}
}

firstBadVersion(70)
