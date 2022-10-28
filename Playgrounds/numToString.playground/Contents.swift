import UIKit

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func returnDigits(for array: [Int]) -> [String] {
    let digits: [String] = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eigth", "Nine"]
    let teens: [String] = ["", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let tens: [String] = ["", "Ten", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    let magnitude: [String] = ["Hundred", "Thousand", "Milion", "Bilion"]
    var words = [String]()
    for (index, number) in array.enumerated() {
        if index == 0 {
            if array.count > 1 && array[index+1] == 1 && number != 0 {
                words.append(teens[number])

            } else {
                words.append(digits[number])
            }
        }

        if index == 1 {
            if number != 1 {
                words.append(tens[number])
            } else if number == 1 && array[index - 1] == 0 {
                words.append(tens[number])
            }
        }

        if index == 2 && number != 0 {
            words += [digits[number] + " " + magnitude[0]]
        }
    }

    words.reverse()
    let result = [words.joined(separator: " ")]
    return result
}

func numberToWords(_ num: Int) -> String {
    let magnitude: [String] = ["Hundred", "Thousand", "Milion", "Bilion"]

    var numArray = String(num).compactMap { Int(String($0)) }
    numArray.reverse()
    let newArray = numArray.chunked(into: 3)
    let moreWords = newArray.map { returnDigits(for: $0) }
    var secondMoreWords = [String]()

    for (index, words) in moreWords.enumerated() {
        if index == 0 {
            print(words)
            secondMoreWords += words
        }

        if index >= 1 && words[0] != " " {
            print(index, words[0])
            secondMoreWords += ["\(words[0]) \(magnitude[index])"]
        }
    }
    secondMoreWords.reverse()
    let result = secondMoreWords.joined(separator: " ")
    return result
}

//numberToWords(358)
//
//numberToWords(3245215)
//numberToWords(2147483647)
numberToWords(1000000)
//numberToWords(25)
//numberToWords(4)
//numberToWords(10)
