import UIKit

func restoreIpAddresses(_ s: String) -> [String] {

    let s = Array(s).map { String($0) }
    var currIP = [String]()
    var result = [String]()

    createIPAdress(0, s, &currIP, &result)

    return result
}

func isValidIP(_ partition: [String]) -> Bool {
    if partition.count > 1 && partition.first == "0" { return false }
    if partition.count > 3 { return false }
    if Int(partition.joined())! > 255 { return false }

    return true
}

func createIPAdress(_ index: Int, _ adressCombo: [String], _ currIP: inout [String], _ result: inout [String]) {
    if index == adressCombo.count && currIP.count == 4 {
        result.append(currIP.joined(separator: "."))
    }

    var secondIndex = index

    while secondIndex < adressCombo.count {
        if isValidIP(Array(adressCombo[index...secondIndex])) {
            currIP.append(adressCombo[index...secondIndex].joined())
            createIPAdress(secondIndex + 1, adressCombo, &currIP, &result)
            currIP.removeLast()
        }

        secondIndex += 1
    }

}

restoreIpAddresses("25525511135")
restoreIpAddresses("0000")
restoreIpAddresses("101023")
