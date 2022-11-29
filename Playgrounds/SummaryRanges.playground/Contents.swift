import UIKit

func summaryRanges(_ nums: [Int]) -> [String] {

    var tempNum = 0
    var tempArray = [Int]()
    var result = [String]()

    if nums.count < 1 {
        return []
    }

    if nums.count == 1 {
        return ["\(nums[0])"]
    }

    for (index, num) in nums.enumerated() {
        if index == 0 {
            tempNum = num
            tempArray.append(num)
        } else {
            if abs(num - tempNum) == 1 {
                tempNum = num
            }

            if abs(num - tempNum) > 1 || index == nums.count - 1 {

                if tempArray[0] != tempNum {
                    tempArray.append(tempNum)
                }

                if tempArray.count > 1 {
                    result.append("\(tempArray[0])->\(tempArray[1])")
                } else {
                    result.append("\(tempArray[0])")
                }


                tempArray = [num]

                if index == nums.count - 1 && tempArray[0] != tempNum {
                    result.append("\(tempArray[0])")
                }

                tempNum = num

            }
        }
    }

    return result
}

summaryRanges([0,1,2,4,5,7])
summaryRanges([0,2,3,4,6,8,9])
summaryRanges([1,2,3,4,7,8,10,14,27,30])
