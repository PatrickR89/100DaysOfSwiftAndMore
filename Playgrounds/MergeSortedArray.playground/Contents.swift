import UIKit

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var numsOne = nums1
    var numsTwo = nums2
    var m = m
    var n = n
    var newArray = [Int]()

    while m + n > 0 {

        if m == 0 {
            newArray.append(numsTwo.first!)
            numsTwo.removeFirst()
            n -= 1
        } else if n == 0 {
            newArray.append(numsOne.first!)
            numsOne.removeFirst()
            m -= 1
        } else if m > 0 && numsOne.first! <= numsTwo.first! {
            newArray.append(numsOne.first!)
            numsOne.removeFirst()
            m -= 1
        } else if n > 0 && numsOne.first! > numsTwo.first! {
            newArray.append(numsTwo.first!)
            numsTwo.removeFirst()
            n -= 1
        } else {
            break
        }
    }
    nums1 = newArray
}

var nums1 = [1,2,3,0,0,0]
merge(&nums1, 3, [2,5,6], 3)
var temp = [1]

merge(&temp, 1, [], 0)

var temp2 = [0]
merge(&temp2, 0, [1], 1)
