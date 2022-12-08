import UIKit

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

    var magazine = Array(magazine)

//    ransomeNote = ransomeNote.map {
//        if let index = magazine.firstIndex(of: $0) {
//            magazine.remove(at: index)
//            return "-"
//        } else {
//            return $0
//        }
//    }

    for char in ransomNote {
        if let index = magazine.firstIndex(of: char) {
            magazine.remove(at: index)
        } else {
            return false
        }
    }

    return true
}

canConstruct("a", "b")
canConstruct("aa", "ab")
canConstruct("aa", "aab")
canConstruct("shalalala", "sčdhfkčjsdanfkljsbfkjldsbakfbfdsjbakjfbjdsbfkjsbafkjsbkjfdbksabfkbsdfkjb")
