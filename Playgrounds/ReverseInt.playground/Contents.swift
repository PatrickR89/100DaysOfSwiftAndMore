import UIKit

func reverse(_ x: Int) -> Int {

    let prefix = x < 0 ? -1 : 1
    let strX = String(String(abs(x)).reversed())

    let newX = Int(strX)! * prefix

    print(Int32.max)
    print(newX)

    if newX > Int32.max || newX < Int32.min {
        return 0
    }

    return newX
}

//reverse(123)
//reverse(-123)
//reverse(120)
//reverse(2147483648)
reverse(6463847412)
reverse(Int(Int32.max))
