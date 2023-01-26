import UIKit

func dominantIndex(_ nums: [Int]) -> Int {

    let largest = nums.max()!
    var isTwiceTheSize = true
    var index = 0

    while isTwiceTheSize && index < nums.count {

        if largest != nums[index] {
            if largest < 2 * nums[index] {
                isTwiceTheSize = false
            }
        }

        index += 1
    }

    var returnValue = -1

    if isTwiceTheSize {
        returnValue = nums.firstIndex(of: largest)!
    }

    return returnValue
}

dominantIndex([3,6,1,0])
dominantIndex([1,2,3,4])
