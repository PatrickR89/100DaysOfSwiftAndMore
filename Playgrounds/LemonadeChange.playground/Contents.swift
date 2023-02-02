import UIKit

func lemonadeChange(_ bills: [Int]) -> Bool {

    var fiveBills = 0
    var tenBills = 0

    for change in bills {
        if change == 5 {
            fiveBills += 1
        } else if change == 10 {
            if fiveBills == 0 { return false }
            fiveBills -= 1
            tenBills += 1
        } else if change == 20 {
            if fiveBills == 0 { return false }
            if tenBills == 0 {
                if fiveBills < 3 { return false }
                fiveBills -= 3
            } else {
                tenBills -= 1
                fiveBills -= 1
            }
        }
    }


    return true
}

lemonadeChange([5,5,5,10,20])
lemonadeChange([5,5,10,10,20])
