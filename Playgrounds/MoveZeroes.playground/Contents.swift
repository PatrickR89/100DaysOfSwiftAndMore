import UIKit

func moveZeroes(_ nums: inout [Int]) {
    var pointer = 0

    for index in nums.indices {
        if nums[index] != 0 {
            let tempNum = nums[index]
            nums[index] = nums[pointer]
            nums[pointer] = tempNum
            pointer += 1
        }
    }
}
var nums = [0,1,0,3,12]
var nums2 = [0]
moveZeroes(&nums)
moveZeroes(&nums2)
