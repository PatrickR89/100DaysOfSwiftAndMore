import UIKit

func moveZeroes(_ nums: inout [Int]) {
    var counter = 0

    nums.forEach {
        if $0 == 0 {
            counter += 1
        }
    }

    for _ in 0...counter {
        if let firstIndex = nums.firstIndex(of: 0) {
            nums.append(nums.remove(at: firstIndex))
        }
    }
}

var nums = [0,1,0,3,12]
var nums2 = [0]
moveZeroes(&nums)
moveZeroes(&nums2)
