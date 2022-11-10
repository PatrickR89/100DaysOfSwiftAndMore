import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.contains(target) {
        return nums.firstIndex(of: target)!
    } else {
        guard let index = nums.firstIndex(where: {target < $0}) else {
            return nums.lastIndex(where: {target > $0})! + 1
        }
        return index
    }
}

searchInsert([1,3,5,6], 5)
searchInsert([1,3,5,6], 2)
searchInsert([1,3,5,6], 7)
