import UIKit

var hexValues: [Int:String] = [0: "0", 1:"1", 2:"2", 3: "3", 4:"4", 5:"5", 6:"6", 7:"7", 8:"8", 9:"9", 10:"a", 11:"b", 12:"c", 13:"d", 14:"e", 15:"f"]

func toHex(_ num: Int) -> String {

    if num == 0 {
        return "0"
    }

    var result = ""
    var tempNum: Int32 = Int32(num)
    var counterOne = 32
    var bits = [Int]()
    var hexContainer = [Int]()
    var tempHex = [String]()

    while counterOne > 0 {
        bits.append(Int(tempNum & 1))
        tempNum = tempNum >> 1
        counterOne -= 1
    }

    while bits.count > 0 {
        let tempContainer = bits[0...3]
        var tempResult = 0
        bits.removeSubrange(0...3)
        for (index, bit) in tempContainer.enumerated() {
            tempResult += bit * NSDecimalNumber(decimal: pow(2, index)).intValue
        }
        hexContainer.append(tempResult)
    }

    hexContainer.forEach {
        let tempValue = hexValues[Int($0)]!
        tempHex.append(String(tempValue))
    }

    tempHex.reverse()
    result = tempHex.joined(separator: "")
    result = result.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)

    return result
}


toHex(26)
toHex(-1)
toHex(-10)
toHex(Int(Int32.max))
toHex(0)
