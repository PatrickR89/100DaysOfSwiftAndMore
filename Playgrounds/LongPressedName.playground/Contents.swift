import UIKit

func isLongPressedName(_ name: String, _ typed: String) -> Bool {

    let name = Array(name)
    let typed = Array(typed)
    var typedIndex = 0

    for index in typed.indices {
        if typedIndex < name.count && name[typedIndex] == typed[index] {
            typedIndex += 1
        } else if index == 0 || typed[index] != typed[index - 1]{
            return false
        }
    }
    return typedIndex == name.count
}

isLongPressedName("alex", "aaleex")
isLongPressedName("saeed", "ssaaedd")
isLongPressedName("alex", "leeeex")
isLongPressedName("vtkgn", "vttkgnn")
isLongPressedName("leelee", "lleeelee")
