import UIKit

func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {

    var nums = nums.sorted()
    var k = k
    var index = 0

    while index < nums.count && nums[index] < 0 && k > 0 {
        nums[index] *= -1
        index += 1
        k -= 1
    }

    if k % 2 == 1 {
        nums = nums.sorted()
        nums[0] *= -1
    }

    return nums.reduce(into: 0) { partialResult, num in
        partialResult += num
    }
}

largestSumAfterKNegations([4,2,3], 1)
largestSumAfterKNegations([3,-1,0,2], 3)
largestSumAfterKNegations([2,-3,-1,5,-4], 2)
