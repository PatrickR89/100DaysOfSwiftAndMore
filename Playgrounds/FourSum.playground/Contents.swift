import UIKit

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {

    var result: [[Int]] = []
    let nums = nums.sorted()
    print(nums)
    var first = 0

    while first < nums.count - 3 {

        var second = first + 1

        while second < nums.count - 2 {

            var third = second + 1
            var fourth = nums.count - 1

            while third < fourth {
                print("1",first, second,third, fourth)
                let sum = nums[first] + nums[second] + nums[third] + nums[fourth]
                print(sum)
                if sum < target {
                    third += 1
                } else if sum > target {
                    fourth -= 1
                } else {
                    result.append([nums[first], nums[second], nums[third], nums[fourth]])
                    third += 1
                    fourth -= 1
                }
            }

            second += 1
        }


        first += 1
    }



    return Array(Set(result))
}

fourSum([1,0,-1,0,-2,2], 0)
