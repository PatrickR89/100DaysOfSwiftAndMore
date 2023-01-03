import UIKit

func arrayPairSum(_ nums: [Int]) -> Int {

    let tempArray = nums.sorted()
    var result = 0

    for index in tempArray.indices {
        if index % 2 == 0 {
            result += min(tempArray[index], tempArray[index + 1])
        }
    }

    return result
}

arrayPairSum([1,4,3,2])
arrayPairSum([6,2,6,5,1,2])
