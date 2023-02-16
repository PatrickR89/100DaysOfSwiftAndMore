import UIKit

func commonChars(_ words: [String]) -> [String] {

    var result = [String]()
    var letterPositions = [String: [Int]]()

    for wordsIndex in words.indices {
        var letterCount = [String: Int]()
        words[wordsIndex].forEach { char in
            letterCount[String(char), default: 0] += 1
        }

        for key in letterCount.keys {
            letterPositions[key, default: []].append(letterCount[key, default: 0])
        }
    }

    letterPositions = letterPositions.filter({ element in
        element.value.count == words.count
    })

    for key in letterPositions.keys {
        var counter = letterPositions[key]!.min()!
        while counter > 0 {
            result.append(key)
            counter -= 1
        }
    }

    return result
}

commonChars(["bella","label","roller"])
commonChars(["cool","lock","cook"])
