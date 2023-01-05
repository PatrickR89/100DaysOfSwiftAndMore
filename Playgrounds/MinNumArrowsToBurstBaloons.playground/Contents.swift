import UIKit

func findMinArrowShots(_ points: [[Int]]) -> Int {

    let baloons = points.sorted(by: {$0[1] < $1[1]})

    var count = 1
    var currentBaloon = baloons[0][1]

    for index in 1..<baloons.count {
        if currentBaloon < baloons[index][0] {
            count += 1
            currentBaloon = baloons[index][1]
        }
    }

    return count
}

findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])
findMinArrowShots([[1,2],[3,4],[5,6],[7,8]])
findMinArrowShots([[1,2],[2,3],[3,4],[4,5]])
findMinArrowShots([[-2147483646,-2147483645],[2147483646,2147483647]])
findMinArrowShots([[1,2]])
findMinArrowShots([[2,3],[2,3]])
findMinArrowShots([[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]])
