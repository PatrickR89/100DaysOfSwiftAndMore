import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {

    if nums.count == 1 && nums[0] != target { return -1}

    var leftPointer = 0
    var rightPointer = nums.count - 1


    while leftPointer <= rightPointer {
        var mid = (leftPointer + rightPointer) / 2
        if nums[mid] == target {
            return mid
        }

        if nums[mid] <= nums[rightPointer] {
            if target > nums[mid] && target <= nums[rightPointer] {
                leftPointer = mid + 1
            } else {
                rightPointer = mid - 1
            }
        } else if nums[leftPointer] <= nums[mid] {
            if target >= nums[leftPointer] && target < nums[mid] {
                rightPointer = mid-1
            } else {
                leftPointer = mid+1
            }
        }
    }

    return -1
}

search([4,5,6,7,0,1,2], 0)
search([1,3], 1)
search([3,1], 1)
search([1], 1)
search([1, 3], 0)
