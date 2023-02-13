import UIKit

func countOdds(_ low: Int, _ high: Int) -> Int {
    
    if low == high && low % 2 == 1 {
        return 1
    } else if low == high && low % 2 == 0 {
        return 0
    }
    
    var count = (high - low) / 2
    
    if low % 2 == 1 || high % 2 == 1 {
        count += 1
    }

    return count
}

//countOdds(3, 7)
//countOdds(8, 10)
//countOdds(9, 9)
//countOdds(213213, 23432433)
countOdds(21, 22)
