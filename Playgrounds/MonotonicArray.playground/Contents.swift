import UIKit

func isMonotonic(_ nums: [Int]) -> Bool {

    var isNonDecreasing = true
    var isNonIncreasing = true

    for index in nums.indices {
        if index > 0 {
            if nums[index] > nums[index - 1] {
                isNonIncreasing = false
            }

            if nums[index] < nums[index - 1] {
                isNonDecreasing = false
            }
        }
    }

    return isNonDecreasing == false && isNonIncreasing == false ? false : true
}

isMonotonic([1,2,2,3])
isMonotonic([6,5,4,4])
isMonotonic([1,3,2])
isMonotonic([2,2,2,2])
