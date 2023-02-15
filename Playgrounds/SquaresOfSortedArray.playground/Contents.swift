import UIKit

func sortedSquares(_ nums: [Int]) -> [Int] {

    var result = nums
    var leftPointer = 0
    var rightPointer = nums.count - 1
    var resultPointer = nums.count - 1

    while leftPointer <= rightPointer {
        if abs(nums[leftPointer]) > abs(nums[rightPointer]) {
            result[resultPointer] = nums[leftPointer] * nums[leftPointer]
            resultPointer -= 1
            leftPointer += 1
        } else {
            result[resultPointer] = nums[rightPointer] * nums[rightPointer]
            resultPointer -= 1
            rightPointer -= 1
        }
    }

    return result
}

sortedSquares([-4,-1,0,3,10])
