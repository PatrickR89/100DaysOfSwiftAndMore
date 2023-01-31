import UIKit

func maxArea(_ height: [Int]) -> Int {


    var leftIndex = 0
    var rightIndex = height.count - 1
    var maxArea = min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex)

    while leftIndex < rightIndex {

        if height[leftIndex] < height[rightIndex] {
            leftIndex += 1
        } else {
            rightIndex -= 1
        }

        let smaller = min(height[leftIndex], height[rightIndex])
        let area = smaller * (rightIndex - leftIndex)
        maxArea = max(maxArea, area)
    }

    return maxArea
}

// MARK: Timelimit Exceeded
//func maxArea(_ height: [Int]) -> Int {
//
//    var maxArea = 0
//
//    for index in 0..<height.count {
//        for secondIndex in index + 1..<height.count {
//            let lower = min(height[index], height[secondIndex])
//            let area = lower * (secondIndex - index)
//            maxArea = max(area, maxArea)
//        }
//    }
//
//    return maxArea
//}

maxArea([1,8,6,2,5,4,8,3,7])
maxArea([1,1])
