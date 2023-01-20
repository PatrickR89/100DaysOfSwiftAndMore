import UIKit

func toLowerCase(_ s: String) -> String {

    let upperCase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let lowerCase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").map {$0.lowercased() }
    var resultString = ""

    s.forEach {
        if let index = upperCase.firstIndex(of: $0) {
            resultString.append(lowerCase[index])
        } else {
            resultString.append($0)
        }
    }

    return resultString
}

toLowerCase("Hello")
toLowerCase("here")
toLowerCase("LOVELY")
