import UIKit

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {

    var result = 0
    var counter = 0

    for num in nums {
        if num == 1 {
            counter += 1
        } else {
            if counter > result {
                print(counter)
                result = counter

            }
            counter = 0
        }
    }

    if counter > result {
        result = counter
    }

    return result
}

findMaxConsecutiveOnes([1,1,0,1,1,1])
findMaxConsecutiveOnes([1,0,1,1,0,1])
