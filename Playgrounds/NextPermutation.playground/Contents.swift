import UIKit

func nextPermutation(_ nums: inout [Int]) {
    if nums.count < 2 {
        return
    }
    var index = nums.count - 2

    while index >= 0 && nums[index] >= nums[index + 1] { index -= 1 }
    if index >= 0 {
        var secondIndex = nums.count - 1
        while nums[secondIndex] <= nums[index] { secondIndex -= 1 }
        swapValues(&nums, index, secondIndex)
    }
    print(index)
    reverseValues(&nums, index + 1, nums.count - 1)
}

func swapValues(_ nums: inout [Int], _ index: Int, _ secondIndex: Int) {
    (nums[index], nums[secondIndex]) = (nums[secondIndex], nums[index])
}

func reverseValues(_ nums: inout [Int], _ index: Int, _ secondIndex: Int) {
    var index = index
    var secondIndex = secondIndex
    while index < secondIndex {
        swapValues(&nums, index, secondIndex)
        index += 1
        secondIndex -= 1
    }
}

var arr = [1,1,5]
nextPermutation(&arr)
print(arr)

var secArra = [3,2,1]
nextPermutation(&secArra)
print(secArra)
