import UIKit

struct Pattern {
    var key: Character
    var value: String
}

func wordPattern(_ pattern: String, _ s: String) -> Bool {

    let words = s.split(separator: " ")

    if pattern.count != words.count {
        return false
    }

    var patterns = [Pattern]()

    for (index, pat) in pattern.enumerated() {
        if patterns.isEmpty {
            patterns.append(Pattern(key: pat, value: String(words[index])))
        } else {
            if let indexP = patterns.firstIndex(where: {$0.key == pat}) {
                if patterns[indexP].value != String(words[index]) {
                    return false
                }
            } else {

                if patterns.contains(where: {$0.value == String(words[index])}) {return false}
                patterns.append(Pattern(key: pat, value: String(words[index])))
            }
        }
    }

    return true
}

wordPattern("abba", "dog cat cat dog")
wordPattern("abba", "dog cat cat fish")
wordPattern("abba", "dog dog dog dog")
wordPattern("aaa", "aa aa aa aa")
