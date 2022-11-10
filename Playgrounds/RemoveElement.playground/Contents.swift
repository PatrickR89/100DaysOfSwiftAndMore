import UIKit

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums.forEach {
        if $0 == val {
            guard let index = nums.firstIndex(where: {$0 == val}) else {return}
            nums.remove(at: index)
        }
    }

    return nums.count
    }

var nums = [0,1,2,2,3,0,4,2]
var val = 2

var nums2 = [3,2,2,3]
var val2 = 3

removeElement(&nums, val)
removeElement(&nums2, val2)
