import UIKit

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {

    var numsDictionary = [Int: Int]()

    for (index, number) in nums.enumerated() {
        if let tempIndex = numsDictionary[number] {
            if abs(index - tempIndex) <= k {
                return true
            }
        }

        numsDictionary[number] = index
    }

    return false
}

containsNearbyDuplicate([1,2,3,1], 3)
containsNearbyDuplicate([1,0,1,1], 1)
containsNearbyDuplicate([1,2,3,1,2,3], 2)
