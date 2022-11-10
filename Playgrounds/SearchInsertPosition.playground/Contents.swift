import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1

    while start <= end {
        let index = start + (end - start)/2

        if nums[index] == target {
            return index
        } else if nums[index] > target {
            end = index - 1
        } else {
            start = index + 1
        }
    }

    return start
}


searchInsert([1,3,5,6], 5)
searchInsert([1,3,5,6,8], 2)
searchInsert([1,3,4,5,6], 7)
