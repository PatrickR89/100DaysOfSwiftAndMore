import UIKit

func hasGroupsSizeX(_ deck: [Int]) -> Bool {

    if deck.count < 2 {
        return false
    }

    var cardDecks = [Int: Int]()

    deck.forEach { card in
        cardDecks[card, default: 0] += 1
    }

    var someDeck = cardDecks.values.max()!

    for value in Set(cardDecks.values) {
        someDeck = gcd(someDeck, value)
    }

    return someDeck > 1 ? true : false
}

func gcd(_ val1: Int, _ val2: Int) -> Int {
    var first = 0
    var second = max(val1, val2)
    var rest = min(val1, val2)

    while rest != 0 {
        first = second
        second = rest
        rest = first % second
    }

    return second
}

hasGroupsSizeX([1,2,3,4,4,3,2,1])
hasGroupsSizeX([1,1,1,2,2,2,3,3])
hasGroupsSizeX([1,1,2,2,2,2])
hasGroupsSizeX([0,0,0,0,0,1,1,2,3,4])
hasGroupsSizeX([1,1,1,1,2,2,2,2,2,2])
hasGroupsSizeX([1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3])
