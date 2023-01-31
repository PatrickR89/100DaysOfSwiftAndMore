import UIKit

func threeSum(_ nums: [Int]) -> [[Int]] {

    var result = Set<[Int]>()
    let nums = nums.sorted()
    for i in 0...nums.count {
        var j = i + 1
        var k = nums.count - 1

        while j < k {
            if nums[i] + nums[j] + nums[k] == 0 {
                result.insert([nums[i], nums[j], nums[k]])
                j += 1
                k -= 1
            } else if nums[i] + nums[j] + nums[k] < 0 {
                j += 1
            } else {
                k -= 1
            }
        }
    }

    return Array(result)
}

//threeSum([-1,0,1,2,-1,-4])
threeSum([3,0,-2,-1,1,2])
