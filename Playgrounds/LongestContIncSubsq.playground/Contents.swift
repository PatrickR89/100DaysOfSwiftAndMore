import UIKit

func findLengthOfLCIS(_ nums: [Int]) -> Int {

    if Set(nums).count == 1 {
        return 1
    }

    var startIndex = 0
    var currIndex: Int = 0
    var subArray = [Int: Int]()
    var endIndex: Int = 1

    while endIndex < nums.count {

        if nums[currIndex] < nums[endIndex] {
            currIndex += 1
            endIndex += 1
        } else {
            startIndex = endIndex
            currIndex = endIndex
            endIndex = currIndex + 1
        }

        subArray[startIndex, default: 1] = currIndex + 1
    }

    return subArray.map {
        return $0.value - $0.key
    }.max()!
}

findLengthOfLCIS([1,3,5,4,7])
findLengthOfLCIS([2,2,2,2,2,2,3])
findLengthOfLCIS([2,1])
