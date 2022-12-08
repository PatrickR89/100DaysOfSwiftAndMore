import UIKit

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

    var ransomeNote = Array(ransomNote)
    var magazine = Array(magazine)

    ransomeNote = ransomeNote.map {
        if let index = magazine.firstIndex(of: $0) {
            magazine.remove(at: index)
            return "-"
        } else {
            return $0
        }
    }

    print(ransomeNote.filter({$0 != "-"}).count)

    return ransomeNote.filter({$0 != "-"}).count == 0
}

canConstruct("a", "b")
canConstruct("aa", "ab")
canConstruct("aa", "aab")
canConstruct("shalalala", "sčdhfkčjsdanfkljsbfkjldsbakfbfdsjbakjfbjdsbfkjsbafkjsbkjfdbksabfkbsdfkjb")
