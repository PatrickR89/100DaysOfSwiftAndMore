import UIKit

class NumArray {

    let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        var sum = 0

        for index in left...right {
            sum += nums[index]
        }

        return sum
    }
}

let firstTry = NumArray([-2, 0, 3, -5, 2, -1])

let firstTryOne = firstTry.sumRange(0, 2)
let firstTryTwo = firstTry.sumRange(2, 5)
let firstTryThree = firstTry.sumRange(0, 5)

