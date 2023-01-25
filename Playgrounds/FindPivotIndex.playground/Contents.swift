import UIKit

func pivotIndex(_ nums: [Int]) -> Int {

    var leftSum = 0
    var rightSum = nums.reduce(into: 0) { partialResult, val in
        partialResult = partialResult + val
    }

    for index in nums.indices {
        rightSum -= nums[index]
        if leftSum == rightSum {
            return index
        }
        leftSum += nums[index]
    }


    return -1
}

pivotIndex([1,7,3,6,5,6])
pivotIndex([2,1,-1])
pivotIndex([1,2,3])
