import UIKit

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {

    var image = image
    let originalColor = image[sr][sc]
    var pixelsToBeModified: [[Int]] = [[sr, sc]]
    let neighbour: [Int] = [-1, 1]

    if color == originalColor { return image }

    while !pixelsToBeModified.isEmpty {
        for pixel in pixelsToBeModified {
            image[pixel[0]][pixel[1]] = color

            for row in neighbour {
                if pixel[0] + row >= 0 && pixel[0] + row < image.count && image[pixel[0] + row][pixel[1]] == originalColor {
                    pixelsToBeModified.append([pixel[0] + row, pixel[1]])
                }
            }

            for col in neighbour {
                if pixel[1] + col >= 0 && pixel[1] + col < image[0].count && image[pixel[0]][pixel[1] + col] == originalColor {
                    pixelsToBeModified.append([pixel[0], pixel[1] + col])
                }
            }

            pixelsToBeModified.removeAll {
                $0 == pixel
            }
        }
    }

    return image
}

floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
