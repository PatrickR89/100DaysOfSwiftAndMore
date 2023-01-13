import UIKit

func findLengthOfLCIS(_ nums: [Int]) -> Int {

    if Set(nums).count == 1 {
        return 1
    }

    var counter: Int = 0
    var currIndex: Int = 0
    var endIndex: Int = 1
    var tempArray = [Int]()

    while endIndex < nums.count {

        tempArray.append(nums[currIndex])

        if nums[currIndex] < nums[endIndex] {
            tempArray.append(nums[endIndex])
            currIndex += 1
            endIndex += 1
        } else {
            tempArray = Array(Set(tempArray))
            counter = max(counter, tempArray.count)
            tempArray = []
            currIndex = endIndex
            endIndex = currIndex + 1
        }
        tempArray = Array(Set(tempArray))
        counter = max(counter, tempArray.count)
    }

    return counter
}

findLengthOfLCIS([1,3,5,4,7])
findLengthOfLCIS([2,2,2,2,2,2,3])
findLengthOfLCIS([2,1])
