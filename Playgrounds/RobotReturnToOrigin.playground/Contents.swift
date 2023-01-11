import UIKit

func judgeCircle(_ moves: String) -> Bool {

    var xTraverse = 0
    var yTraverse = 0

    moves.forEach {
        if $0 == "U" {
            yTraverse += 1
        } else if $0 == "D" {
            yTraverse -= 1
        } else if $0 == "L" {
            xTraverse -= 1
        } else if $0 == "R" {
            xTraverse += 1
        }
    }

    return xTraverse == 0 && yTraverse == 0
}

judgeCircle("UD")
judgeCircle("LL")
