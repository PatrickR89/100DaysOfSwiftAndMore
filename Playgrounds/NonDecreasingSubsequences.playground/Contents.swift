import UIKit

func findSubsequences(_ nums: [Int]) -> [[Int]] {

    var result = [[Int]]()

//    for main in 0..<nums.count {
//
        var currSubsequence = [Int]()
//        currSubsequence.append(nums[main])

        generateSubsequence(&currSubsequence, 0, nums, &result)
//    }
//    print(result)
    return Array(Set(result))
}

func generateSubsequence(_ currSub: inout [Int], _ index: Int, _ nums: [Int], _ result: inout [[Int]]) {
    if index >= nums.count {
        if currSub.count > 1 {
            result.append(currSub)
        }
        return
    }

    if currSub.isEmpty || nums[index] >= currSub.last! {
        currSub.append(nums[index])
        generateSubsequence(&currSub, index + 1, nums, &result)
        currSub.removeLast()
    }

    generateSubsequence(&currSub, index + 1, nums, &result)
}

/*
func generateSubsequence(_ currSub: [Int], _ start: Int, _ nums: [Int], _ result: inout [[Int]]) {

    guard start <= nums.count else {return}
    var currSubsequence = currSub

    for index in start..<nums.count {
        if nums[index] >= nums[index - 1] {
            currSubsequence.append(nums[index])
            result.append(currSubsequence)

            print("current sub: ",currSubsequence, "sub indices: ", index)
        }
        generateSubsequence(currSub, start + 1, nums, &result)
    }
}
*/

findSubsequences([4,6,7,7])
findSubsequences([4,4,3,2,1])
findSubsequences([1,3,5,7])
// [[1,3],[1,3,5],[1,3,5,7],[1,3,7],[1,5],[1,5,7],[1,7],[3,5],[3,5,7],[3,7],[5,7]]


