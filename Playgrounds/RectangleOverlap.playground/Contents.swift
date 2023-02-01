import UIKit

func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {

    let firstLower = rec1[0] < rec2[2] && rec1[1] < rec2[3]
    let overlapStart = rec2[0] < rec1[2] && rec2[1] < rec1[3]

    return firstLower && overlapStart
}

isRectangleOverlap([0,0,2,2], [1,1,3,3])
isRectangleOverlap([0,0,1,1], [1,0,2,1])
isRectangleOverlap([0,0,1,1], [2,2,3,3])
isRectangleOverlap([7,8,13,15], [10,8,12,20])

