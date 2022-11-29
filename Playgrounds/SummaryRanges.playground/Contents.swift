import UIKit

func summaryRanges(_ nums: [Int]) -> [String] {

    if nums.count < 1 {
        return []
    }

    if nums.count == 1 {
        return ["\(nums[0])"]
    }

    var startNum = nums[0]
    var endNum = nums[0]
    var result = [String]()

    for index in 1..<nums.count {
        if abs(nums[index] - endNum) == 1 {
            endNum = nums[index]
        } else {
            if startNum == endNum {
                result.append("\(startNum)")
            } else {
                result.append("\(startNum)->\(endNum)")
            }

            endNum = nums[index]
            startNum = nums[index]
        }

        if index == nums.count - 1 {
            if startNum == endNum {
                result.append("\(startNum)")
            } else {
                result.append("\(startNum)->\(endNum)")
            }
        }
    }

    return result
}

summaryRanges([0,1,2,4,5,7])
summaryRanges([0,2,3,4,6,8,9])
summaryRanges([1,2,3,4,7,8,10,14,27,30])
