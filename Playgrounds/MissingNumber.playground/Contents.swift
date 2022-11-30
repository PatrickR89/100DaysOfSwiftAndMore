import UIKit

func missingNumber(_ nums: [Int]) -> Int {

    var temp = nums.count

    for ind in nums.indices {
        temp = temp ^ nums[ind] ^ ind
    }

    return temp
}

missingNumber([3,0,1])
missingNumber([0,1])
missingNumber([9,6,4,2,3,5,7,0,1])
