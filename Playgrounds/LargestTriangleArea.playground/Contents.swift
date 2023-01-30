import UIKit

func largestTriangleArea(_ points: [[Int]]) -> Double {

    var result: Double = 0.0

    for firstPoint in points {
        for secondPoint in points {
            for thirdPoint in points {
                result = max(result, Double(calculateArea(firstPoint, secondPoint, thirdPoint)) * 0.5)
            }
        }
    }

    return result
}

func calculateArea(_ first: [Int], _ second: [Int], _ third: [Int]) -> Int {
    let widthOne = second[0] - first[0]
    let widthTwo = third[0] - first[0]
    let heightOne = third[1] - first[1]
    let heightTwo = second[1] - first[1]

    return abs(widthOne * heightOne - widthTwo * heightTwo)
}

largestTriangleArea([[0,0],[0,1],[1,0],[0,2],[2,0]])
largestTriangleArea([[1,0],[0,0],[0,1]])
