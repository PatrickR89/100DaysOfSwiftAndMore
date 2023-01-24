import UIKit

func isOneBitCharacter(_ bits: [Int]) -> Bool {

    let bits = Array(bits)
    var index = 0

    while index < bits.count - 1 {
        if bits[index] == 0 {
            index += 1
        } else if bits[index] == 1 {
            index += 2
        }
    }

    return index == bits.count - 1
}

isOneBitCharacter([1,0,0])
isOneBitCharacter([1,1,1,0])
