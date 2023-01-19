import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {

    var resultIndex = 0

    while resultIndex < nums.count {

        var counter = Int32.bitWidth
        var tempNum = nums[resultIndex]
        var tempTarget = target
        var isTarget = false

        while counter > 0 {
            if tempNum & 1 == tempTarget & 1 {
                tempNum = tempNum >> 1
                tempTarget = tempTarget >> 1
                isTarget = true
                counter -= 1
            } else {
                isTarget = false
                break
            }
        }

        if isTarget {
            break
        } else {
            resultIndex += 1
        }
    }

    if resultIndex >= nums.count {
        resultIndex = -1
    }

    return resultIndex
}

search([-1,0,3,5,9,12], 9)
search([-1,0,3,5,9,12], 2)
