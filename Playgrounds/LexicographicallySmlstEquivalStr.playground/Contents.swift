import UIKit

func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {

    var charContainer = [[Character]].init(repeating: [], count: Set(s1).count)
    let s1 = Array(s1)
    let s2 = Array(s2)

    for index in 0..<s1.count {
        for charIndex in 0..<charContainer.count {
            if charContainer[charIndex].contains(s1[index]) || charContainer[charIndex].contains(s2[index]) {
                if !charContainer[charIndex].contains(s2[index]) && s2[index] != s1[index] {
                    charContainer[charIndex].append(s2[index])
                }
                if !charContainer[charIndex].contains(s1[index]) && s2[index] != s1[index] {
                    charContainer[charIndex].append(s1[index])
                }
                break
            } else if !charContainer[charIndex].contains(s1[index]) && charContainer[charIndex].isEmpty && !charContainer[charIndex].contains(s2[index]){
                if (s1[index] != s2[index]) {
                    charContainer[charIndex].append(s1[index])
                    charContainer[charIndex].append(s2[index])
                } else {
                    charContainer[charIndex].append(s1[index])
                }

                break
            }
        }
    }


    for index in 0..<charContainer.count {
        if index > 0 {
            for charIndex in 0..<charContainer[index].count {
                if let indexCont = charContainer.firstIndex(where: {$0.contains(charContainer[index][charIndex])}) {
                    if indexCont != index {
                        charContainer[indexCont] += charContainer[index]
                        charContainer[index] = []
                        break
                    }
                }
            }
        }
    }

    charContainer = charContainer.filter { !$0.isEmpty }
    charContainer = charContainer.map {Array(Set($0)).sorted()}

    print(charContainer)

    var result = [String]()

    baseStr.forEach { char in
        if let index = charContainer.firstIndex(where: { $0.contains(char)}) {
            result.append(String(charContainer[index][0]))
        } else {
            result.append(String(char))
        }
    }

    return result.joined()
}

//smallestEquivalentString("parker", "morris", "parser")
//smallestEquivalentString("hello", "world", "hold")
//smallestEquivalentString("leetcode", "programs", "sourcecode")

smallestEquivalentString("cgokcgerolkgksgbhgmaaealacnsshofjinidiigbjerdnkolc", "rjjlkbmnprkslilqmbnlasardrossiogrcboomrbcmgmglsrsj", "bxbwjlbdazfejdsaacsjgrlxqhiddwaeguxhqoupicyzfeupcn")
// "axawaaaaazaaaaaaaaaaaaaxaaaaawaaauxaaauaaayzaauaaa"
