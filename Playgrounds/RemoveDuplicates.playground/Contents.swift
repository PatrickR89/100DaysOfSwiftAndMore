import UIKit
import Darwin

func removeDuplicates(_ nums: inout [Int]) -> Int {
    nums = Array(Set(nums)).sorted()
    return nums.count
    }
var nums = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates(&nums)
