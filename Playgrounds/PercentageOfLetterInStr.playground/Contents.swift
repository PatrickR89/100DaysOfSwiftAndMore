import UIKit

func percentageLetter(_ s: String, _ letter: Character) -> Int {

    if !s.contains(letter) {
        return 0
    }

    var count = 0

    s.forEach {
        if $0 == letter {
            count += 1
        }
    }

    return (count * 100) / s.count
}

percentageLetter("foobar", "o")
percentageLetter("jjjjjjj", "k")
