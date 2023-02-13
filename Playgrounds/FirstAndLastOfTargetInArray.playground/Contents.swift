import UIKit

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {

    if nums.isEmpty {
        return [-1, -1]
    }

    if nums.count == 1 && nums[0] != target {
        return [-1, -1]
    } else if nums.count == 1 && nums[0] == target {
        return [0, 0]
    }

    var leftPointer = 0
    var rightPointer = nums.count - 1

    while leftPointer <= rightPointer {
        var mid = (rightPointer + leftPointer) / 2

        if nums[mid] == target {
            leftPointer = mid
            rightPointer = mid
            break
        }

        if nums[mid] <= nums[rightPointer] {
            if target > nums[mid] && target <= nums[rightPointer] {
                leftPointer = mid + 1
            } else {
                rightPointer = mid - 1
            }
        } else if nums[mid] >= nums[leftPointer] {
            if target < nums[mid] && target >= nums[leftPointer] {
                rightPointer = mid - 1
            } else {
                leftPointer = mid + 1
            }
        }
    }

    print(target, leftPointer, rightPointer)

    if leftPointer > nums.count - 1 || rightPointer < 0 || rightPointer < leftPointer {
        return [-1, -1]
    }

    while nums[leftPointer] == target && leftPointer > 0 && leftPointer <= rightPointer {
        leftPointer -= 1
    }

    if nums[leftPointer] != target {
        leftPointer += 1
    }

    while nums[rightPointer] == target && rightPointer < nums.count - 1  && leftPointer <= rightPointer {
        rightPointer += 1
    }

    if nums[rightPointer] != target {
        rightPointer -= 1
    }

    return [leftPointer, rightPointer]
}

searchRange([5,7,7,8,8,10], 8)
searchRange([5,7,7,8,8,10], 6)
searchRange([0,2], 0)
searchRange([2, 2], 1)
searchRange([2, 2], 2)
searchRange([1,2,3], 2)
searchRange([1,2,3,3,3,3,4,5,9], 3)
