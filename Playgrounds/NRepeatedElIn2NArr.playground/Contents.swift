import UIKit

func repeatedNTimes(_ nums: [Int]) -> Int {

    var repeats = [Int: Int]()

    for index in nums.indices {
        repeats[nums[index], default: 0] += 1
        if repeats[nums[index], default: 0] > 1 {
            return nums[index]
        } 
    }

    return 0
    }

repeatedNTimes([5,1,5,2,5,3,5,4])
