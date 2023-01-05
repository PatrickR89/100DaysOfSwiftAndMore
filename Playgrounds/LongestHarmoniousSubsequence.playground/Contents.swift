import UIKit

func findLHS(_ nums: [Int]) -> Int {

    var lastNums = [Int]()
    var currentNums = [Int]()
    collectHarmonious(nums, 0, &lastNums, &currentNums)

    print(lastNums)

    return lastNums.count
}

func collectHarmonious(_ nums: [Int], _ index: Int, _ lastNums: inout [Int], _ currentNums: inout [Int]) {

    currentNums.append(nums[index])

    for numIndex in (index + 1)..<nums.count {
        if nums[numIndex] == nums[index] || nums[numIndex] - nums[index] == 1 {
            currentNums.append(nums[numIndex])
        }
    }

    compareResults(&lastNums, &currentNums)

    currentNums.append(nums[index])

    for numIndex in (index + 1)..<nums.count {
        if nums[numIndex] == nums[index] || nums[numIndex] - nums[index] == -1 {
            currentNums.append(nums[numIndex])
        }
    }

    compareResults(&lastNums, &currentNums)

    if index + 1 < nums.count {
        collectHarmonious(nums, index + 1, &lastNums, &currentNums)
    }

}

func compareResults(_ lastNums: inout [Int], _ currentNums: inout [Int]) {
    if currentNums.count > lastNums.count && currentNums.contains(where: { $0 != currentNums[0] }) {
        lastNums = currentNums
    }

    currentNums = []
}

findLHS([1,3,2,2,5,2,3,7])
findLHS([1,2,3,4])
findLHS([1,1,1,1])
findLHS([1,4,1,3,1,-14,1,-13])
