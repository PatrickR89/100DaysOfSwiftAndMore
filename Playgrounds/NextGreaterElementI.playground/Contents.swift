import UIKit

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dictionary = [Int: Int]()
    var stack = [Int]()

    for num in nums2 {
        while !stack.isEmpty && stack.last! < num {
            dictionary[stack.removeLast()] = num
        }

        stack.append(num)
    }

    return nums1.map { dictionary[$0] ?? -1}
}

nextGreaterElement([4,1,2], [1,3,4,2])
nextGreaterElement([1,3,5,2,4], [6,5,4,3,2,1,7])
