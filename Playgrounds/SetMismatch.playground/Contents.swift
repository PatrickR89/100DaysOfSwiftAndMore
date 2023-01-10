import UIKit

func findErrorNums(_ nums: [Int]) -> [Int] {

    let nums = nums.sorted()
    var result = [Int]()

    for index in 1..<nums.count {
        if nums[index] == nums[index - 1] {
            if nums[0...index - 1].count < nums[index - 1] {
                let missing = findMissingNum(Array(nums[0...(index - 1)]), 1, nums[index])
                result = [nums[index], missing]
            } else {
                let missing = findMissingNum(Array(nums[index - 1..<nums.count]), nums[index], nums.count)
                result = [nums[index], missing]
            }
        }
    }

    return result
}

func findMissingNum(_ nums: [Int], _ minValue: Int, _ maxValue: Int) -> Int {
    var missingNum = minValue
    var result = 1

    while missingNum <= maxValue {
        if !nums.contains(missingNum) {
            result = missingNum
            break
        } else {
            missingNum += 1
        }
    }

    return result
}

findErrorNums([1,2,2,4])
findErrorNums([1, 1])
findErrorNums([2, 2])
findErrorNums([2,3,2])
findErrorNums([3,2,3,4,6,5])
