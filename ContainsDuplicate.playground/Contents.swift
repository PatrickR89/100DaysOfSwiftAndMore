import UIKit

func containsDuplicate(_ nums: [Int]) -> Bool {

    let length = nums.count

    for i in 0..<length {
        for j in i + 1..<length {
            if nums[i] == nums[j] {
                return true
            }
        }
    }
    return false
}

containsDuplicate([1,2,3,1])
containsDuplicate([1,2,3,4])
containsDuplicate([1,1,1,3,3,4,3,2,4,2])
containsDuplicate([2,14,18,22,22])
containsDuplicate([0,4,5,0,3,6])

func containsDuplicate2(_ nums: [Int]) -> Bool {
    if nums.count < 2 {
        return false
    }

    for (index, num) in nums.enumerated() {
        if index == 0 {
            if nums[index + 1...nums.count - 1].contains(num) {
                return true
            }
        } else if index == nums.count - 1 {
            if nums[0...index - 1].contains(num) {
                return true
            }
        } else {
            if nums[0...index - 1].contains(num) || nums[index + 1...nums.count - 1].contains(num) {
                return true
            }
        }
    }

    return false
}

func containsDuplicateOriginal(_ nums: [Int]) -> Bool {
    if Array(Set(nums)).count == nums.count {
        return false
    } else {
        return true
    }
}

