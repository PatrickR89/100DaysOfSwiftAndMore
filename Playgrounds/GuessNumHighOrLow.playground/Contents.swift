import UIKit

func guessNumber(_ n: Int) -> Int {

    if guess(n) == 0 {
        return n
    }
    var low = 0
    var high = n

    while guess((high + low) / 2) != 0 {
        if guess((high + low) / 2) == 1 {
            low = (high + low) / 2
        } else if guess((high + low) / 2) == -1 {
            high = (high + low) / 2
        }
    }

    return (high + low) / 2
}

func guess(_ num: Int) -> Int {
    let answ = 1
    if num > answ {
        return -1
    } else if num == answ {
        return 0
    } else {
        return 1
    }
}

//guessNumber(8998798798)
guessNumber(2)
