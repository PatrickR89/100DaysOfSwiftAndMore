import UIKit

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {

    var currResult = Int.max
    var result = 0
    let nums = nums.sorted()
    for i in 0...nums.count {
        var j = i + 1
        var k = nums.count - 1

        while j < k {
            let sum = nums[i] + nums[j] + nums[k]
            let difference = abs(target - sum)

            if difference < currResult {
                currResult = difference
                result = sum
            }

            if sum > target {
                k -= 1
            } else {
                j += 1
            }
        }
    }

    return result
}

threeSumClosest([-1,2,1,-4], 1)
