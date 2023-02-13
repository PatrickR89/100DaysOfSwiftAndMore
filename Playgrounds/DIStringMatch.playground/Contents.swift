import UIKit

func diStringMatch(_ s: String) -> [Int] {

    var s = Array(s)
    var max = s.count
    var min = 0
    var result = [Int]()

    for char in s {
        if char == "I" {
            result.append(min)
            min += 1
        } else if char == "D" {
            result.append(max)
            max -= 1
        }
    }

    result.append(min)

    return result
}

diStringMatch("IDID")
diStringMatch("DDI")
diStringMatch("III")
diStringMatch("IDI")
