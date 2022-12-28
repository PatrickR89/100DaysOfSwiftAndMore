import UIKit

func reverseWords(_ s: String) -> String {

    return Array( s.split(separator: " ")).map { return String($0.reversed()) }.joined(separator: " ")
}

reverseWords("Let's take LeetCode contest")
