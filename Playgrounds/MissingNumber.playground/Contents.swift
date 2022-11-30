import UIKit

func missingNumber(_ nums: [Int]) -> Int {

    for index in 0...nums.count {
        if !nums.contains(index) {
            return index
        }
    }

    return 0
}

missingNumber([3,0,1])
missingNumber([0,1])
missingNumber([9,6,4,2,3,5,7,0,1])
