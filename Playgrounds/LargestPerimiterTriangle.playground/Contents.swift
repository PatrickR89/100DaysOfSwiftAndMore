import UIKit

func largestPerimeter(_ nums: [Int]) -> Int {

    let nums = nums.sorted()

    var index = nums.count - 1

    while index > 1 {
        if nums[index] < (nums[index - 1] + nums[index - 2]) {
            return nums[index] + nums[index - 1] + nums[index - 2]
        }

        index -= 1
    }

    return 0
}

largestPerimeter([2,1,2])
largestPerimeter([1,2,1,10])
largestPerimeter([3,6,2,3])
