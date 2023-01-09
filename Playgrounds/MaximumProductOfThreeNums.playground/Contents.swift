import UIKit

func maximumProduct(_ nums: [Int]) -> Int {

    let last = nums.count - 1
    let tempNums = nums.sorted()

    let firstResult = tempNums[0] * tempNums[1] * tempNums[last]
    let secondResult = tempNums[last] * tempNums[last - 1] * tempNums[last - 2]

    return max(firstResult, secondResult)
}

maximumProduct([1,2,3])
maximumProduct([1,2,3,4])
maximumProduct([-1,-2,-3])
maximumProduct([-100,-98,-1,2,3,4])
