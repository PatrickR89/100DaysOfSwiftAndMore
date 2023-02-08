import UIKit

func sortArrayByParity(_ nums: [Int]) -> [Int] {

    var result = [Int]()

    for num in nums {
        if num % 2 == 0 {
            result.insert(num, at: 0)
        } else {
            result.append(num)
        }
    }

    return result
}

sortArrayByParity([3,1,2,4])
sortArrayByParity([0])
sortArrayByParity([2, 4, 7, 6, 5, 3])
