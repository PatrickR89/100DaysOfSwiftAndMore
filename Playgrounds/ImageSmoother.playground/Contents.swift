import UIKit

func imageSmoother(_ img: [[Int]]) -> [[Int]] {

    var newImage = img
    let rowCount = img.count
    let colCount = img[0].count

    for row in 0..<rowCount {
        for col in  0..<colCount {
            var cellSum = 0
            var fieldCounter = 0
            for cellRow in -1...1 {
                for cellCol in -1...1 {
                    if cellCol + col >= 0 && cellCol + col < colCount && cellRow + row >= 0 && cellRow + row < rowCount {
                        cellSum += img[cellRow + row][cellCol + col]
                        fieldCounter += 1
                    }
                }
            }

            let newValue = Int(floor(Double(cellSum) / Double(fieldCounter)))
            newImage[row][col] = newValue
        }
    }


    return newImage
}

imageSmoother([[1,1,1],[1,0,1],[1,1,1]])
imageSmoother([[100,200,100],[200,50,200],[100,200,100]])
