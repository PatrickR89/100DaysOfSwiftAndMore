import UIKit

func licenseKeyFormatting(_ s: String, _ k: Int) -> String {

    let newS = Array(s.replacingOccurrences(of: "-", with: "").uppercased().reversed())
    var result = [String]()
    var newK = k

    for index in 0..<newS.count {
        result.append(String(newS[index]))

        newK -= 1
        if newK == 0 && index < newS.count - 1 {
            result.append("-")
            newK = k
        }

    }

    result = Array(result.reversed())

    return result.joined()
}

licenseKeyFormatting("5F3Z-2e-9-w", 4)
licenseKeyFormatting("2-5g-3-J", 2)
