import UIKit

func containsDuplicate(_ nums: [Int]) -> Bool {
    if Array(Set(nums)).count == nums.count {
        return false
    } else {
        return true
    }
}

containsDuplicate([1,2,3,1])
containsDuplicate([1,2,3,4])
containsDuplicate([1,1,1,3,3,4,3,2,4,2])
