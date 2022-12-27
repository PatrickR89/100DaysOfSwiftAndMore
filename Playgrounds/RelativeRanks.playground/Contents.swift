import UIKit

func findRelativeRanks(_ score: [Int]) -> [String] {

    let tempScore = score.sorted { $0 > $1}

    let result: [String] = score.map {
        if $0 == tempScore[0] {
            return "Gold Medal"
        } else if $0 == tempScore[1] {
            return "Silver Medal"
        } else if $0 == tempScore[2] {
            return "Bronze Medal"
        } else {
            guard let index = tempScore.firstIndex(of: $0) else {return "-"}
            return "\(index + 1)"
        }
    }

    return result
}

findRelativeRanks([5,4,3,2,1])
findRelativeRanks([10,3,8,9,4])
