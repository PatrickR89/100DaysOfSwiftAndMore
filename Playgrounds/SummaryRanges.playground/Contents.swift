import UIKit

func summaryRanges(_ nums: [Int]) -> [String] {

    if nums.count < 1 {
        return []
    }

    if nums.count == 1 {
        return ["\(nums[0])"]
    }

    var startPointer = 0
    var endPointer = 0
    var result = [String]()

    for index in 1..<nums.count {
        if abs(nums[index] - nums[endPointer]) == 1 {
            endPointer = index
        } else {
            if startPointer == endPointer {
                result.append("\(nums[startPointer])")
            } else {
                result.append("\(nums[startPointer])->\(nums[endPointer])")
            }

            endPointer = index
            startPointer = index
        }

        if index == nums.count - 1 {
            if startPointer == endPointer {
                result.append("\(nums[startPointer])")
            } else {
                result.append("\(nums[startPointer])->\(nums[endPointer])")
            }
        }
    }

    return result
}

summaryRanges([0,1,2,4,5,7])
summaryRanges([0,2,3,4,6,8,9])
summaryRanges([1,2,3,4,7,8,10,14,27,30])
