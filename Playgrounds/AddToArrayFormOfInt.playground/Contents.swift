import UIKit

func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {

    var result = num
    var add = String(k).compactMap { $0.wholeNumberValue }

    if add.count > result.count {
        var counter = add.count - result.count
        while counter > 0 {
            result.insert(0, at: 0)
            counter -= 1
        }
    }
    var pass = 0
    var counter = 1
    while counter <= result.count {
        var addOn = add.count - counter >= 0 ? (add[add.count - counter] + pass) : pass
        var value = result[result.count - counter] + addOn

        if value > 9 {
            pass = 1
            value -= 10
        } else {
            pass = 0
        }

        result[result.count - counter] = value

        if counter == result.count && pass == 1 {
            result.insert(0, at: 0)
        }

        counter += 1
    }

    return result
}

addToArrayForm([1,2,0,0], 34)
addToArrayForm([2,1,5], 806)
addToArrayForm([5,2], 122)
addToArrayForm([9,9,9,9,9,9,9,9,9,9], 1)
addToArrayForm([6,5,6], 6)
