import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var twoSum = [Int]()
        for (index, number) in nums.enumerated() {
            let rest = target - number
            if let indexR = nums.firstIndex(where: {$0 == rest}) {
                if indexR != index {
                    twoSum += [index, indexR]
                }
            }
        }
    print(Array(Set(twoSum)))
    return twoSum
    }


twoSum([2,7,11,15], 9)
twoSum([3, 2, 4], 6)
twoSum([3, 3], 6)
