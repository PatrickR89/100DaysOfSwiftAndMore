import UIKit

func arrangeCoins(_ n: Int) -> Int {

    var coins = n
    var counter = 0

    while coins > 0 {
        if coins > counter {
            coins = coins - counter - 1
            counter += 1
        } else {
            coins = 0
        }
    }

    return counter
}

arrangeCoins(5)
arrangeCoins(8)
arrangeCoins(83246983)
