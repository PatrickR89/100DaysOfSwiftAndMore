import UIKit

func validMountainArray(_ arr: [Int]) -> Bool {

    if arr.count < 3 {
        return false
    }

    var increasing = true
    var wasIncreasing = false
    var wasDecreasing = false
    var previous = arr[0]

    for index in 1..<arr.count {
        if arr[index] > previous && increasing {
            previous = arr[index]
            wasIncreasing = true
        } else if arr[index] < previous {
            increasing = false
            previous = arr[index]
            wasDecreasing = true
        } else {
            return false
        }
    }

    return wasIncreasing && wasDecreasing
}

validMountainArray([0,3,2,1])
validMountainArray([3,5,5])
validMountainArray([2,1])
validMountainArray([0,1,2,3,4,5,6,7,8,9])
