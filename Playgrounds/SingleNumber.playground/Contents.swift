import UIKit

func singleNumber(_ nums: [Int]) -> Int {

    if nums.count == 1 {
        return nums[0]
    }

    for (index, num) in nums.enumerated() {
        if index < 1 {
            if nums[index+1...nums.count-1].contains(num) {
                continue
            } else {
                return num
            }
        }
        if index >= 1 && index <= nums.count - 2 {
            if nums[index+1...nums.count-1].contains(num) {
                continue
            } else if nums[0...index-1].contains(num) {
                continue
            } else {
                return num
            }
        }
    }

    return nums[nums.count - 1]
}

singleNumber([2,2,1])
singleNumber([4,1,2,1,2])
singleNumber([1])
singleNumber([1,0,1])
