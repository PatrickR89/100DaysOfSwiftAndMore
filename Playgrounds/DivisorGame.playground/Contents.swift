import UIKit

func divisorGame(_ n: Int) -> Bool {

    var gameStat = [Bool?](repeating: nil, count: max(2, n + 1))
    gameStat[0] = true
    gameStat[1] = false

    return playGame(n, &gameStat)
}

func playGame(_ n: Int, _ stats: inout [Bool?]) -> Bool {
    if let stat = stats[n] {
        return stat
    }

    stats[n] = false
    var gameRound = 1

    while gameRound * gameRound <= n {
        if n % gameRound == 0 {
            if !playGame(n - gameRound, &stats) || !playGame(n - (n / gameRound), &stats) {
                stats[n] = true
                break
            }
        }

        gameRound += 1
    }
    return stats[n]!
}


divisorGame(2)
divisorGame(3)
