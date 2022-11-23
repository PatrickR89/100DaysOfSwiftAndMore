import UIKit

func majorityElement(_ nums: [Int]) -> Int {

    let individuals = Array(Set(nums))

    for num in individuals {
        if nums.filter({$0 == num}).count > nums.count / 2 {
            return num
        }
    }
    return 0
}

majorityElement([3,2,3])
majorityElement([2,2,1,1,1,2,2])
