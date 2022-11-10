import UIKit

func lengthOfLastWord(_ s: String) -> Int {
    let words = s.split(separator: " ")
    return words[words.count - 1].count
    }

lengthOfLastWord("Hello World")
lengthOfLastWord("   fly me   to   the moon  ")
lengthOfLastWord("luffy is still joyboy")
