import UIKit

func sortArrayByParityII(_ nums: [Int]) -> [Int] {

    var result = Array(repeating: 0, count: nums.count)
    var odds = [Int]()
    var evens = [Int]()

    nums.forEach { val in
        if val % 2 == 0 {
            evens.append(val)
        } else {
            odds.append(val)
        }
    }

    for index in result.indices {
        if index % 2 == 0 {
            result[index] = evens.removeFirst()
        } else {
            result[index] = odds.removeFirst()
        }
    }

    return result
}

sortArrayByParityII([4,2,5,7])
