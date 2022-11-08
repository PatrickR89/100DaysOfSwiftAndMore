import UIKit

enum BracketType {
    case round
    case square
    case curly
}

struct Bracket {
    var bracketType: BracketType
    var isOpen: Bool

    init(_ value: Character) {
        if value == "(" || value == ")" {
            self.bracketType = .round
        } else if value == "[" || value == "]" {
            self.bracketType = .square
        } else if value == "{" || value == "}" {
            self.bracketType = .curly
        } else {
            self.bracketType = .round
        }

        if value == "(" || value == "[" || value == "{" {
            self.isOpen = true
        } else {
            self.isOpen = false
        }
    }
}

func isValid(_ s: String) -> Bool {

    var numOfOpen = 0
    var numOfClose = 0

    var mirrorArray = s.map { string in
        return Bracket(string)
    }

    if mirrorArray[0].isOpen == false {return false}
    if mirrorArray[mirrorArray.count - 1].isOpen == true {return false}

    mirrorArray.forEach {
        if $0.isOpen == true {
            numOfOpen += 1
        } else if $0.isOpen == false {
            numOfClose += 1
        }
    }
    if numOfOpen != numOfClose {return false}

    while mirrorArray.count > 0 {
        guard let firstIndex = mirrorArray.firstIndex(where: {$0.isOpen == false}) else {fatalError()}
        if mirrorArray[firstIndex - 1].bracketType == mirrorArray[firstIndex].bracketType && mirrorArray[firstIndex - 1].isOpen == true {
            mirrorArray.remove(at: firstIndex)
            mirrorArray.remove(at: firstIndex - 1)
        } else {
            return false
        }
    }

    return true
}




isValid("()[]{}")
isValid("({}[(){}])")
isValid("(([[[{}]]))]")
