import UIKit
import Foundation

func maxPoints(_ points: [[Int]]) -> Int {

    let length = points.count

    if length < 3 {
        return length
    }

    var result = 0

    for i in 0..<length {
        var dict = [Double: Int]()

        for j in (i + 1)..<length {

            let yAxis = Double(points[i][1] - points[j][1])
            let xAxis = Double(points[i][0] - points[j][0])
            if xAxis != 0 {
                dict[(yAxis/xAxis), default: 0] += 1
            } else {
                dict[Double(10001), default: 0] += 1
            }
        }

        var maxCount = 0

        print(" for: ", points, " dict: ", dict, "for index: ", i)

        for value in dict {
            maxCount = max(maxCount, value.value)

        }
        result = max(maxCount+1, result)
    }


    return result
}


maxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]])
maxPoints([[1,1],[2,2],[3,3]])
maxPoints([[1, 1]])
maxPoints([[0, 0]])
maxPoints([[1,0],[0,0]])
maxPoints([[0, 0], [0, 1], [0, 2], [0, 3], [1, 2], [2, 1]])
maxPoints([[0,1],[0,0],[0,4],[0,-2],[0,-1],[0,3],[0,-4]]) //7
maxPoints([[0,0],[1,-1],[1,1]])
