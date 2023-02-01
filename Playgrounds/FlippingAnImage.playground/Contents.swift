import UIKit

func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {

    var newImage = image.map { Array($0.reversed()) }

    for row in newImage.indices {
        for col in newImage.indices {
            if newImage[row][col] == 1 {
                newImage[row][col] = 0
            } else {
                newImage[row][col] = 1
            }
        }
    }
    return newImage
}

flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])
