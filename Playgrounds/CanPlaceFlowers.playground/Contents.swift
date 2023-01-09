import UIKit

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {

    if flowerbed.count == 0 {
        return false
    } else if flowerbed.count == 1 {
        guard flowerbed[0] == 0 else { return n == 0 }
        return n < 2
    }

    var pointerLeft = 0
    var pointerRight = 0
    var counter = 0
    var spaces = 0

    let firstFlower = flowerbed.firstIndex(of: 1) ?? 0

    counter = (firstFlower < flowerbed.count / 2 ? (flowerbed.count - firstFlower ) / 2 : firstFlower / 2) + 1
    pointerLeft = firstFlower
    pointerRight = firstFlower

    while counter > 0 {
        print("left: ", pointerLeft, "right: ", pointerRight)
        if pointerLeft >= 0 {
            let previous = pointerLeft - 1 > 0 ? pointerLeft - 1 : 1
            if flowerbed[pointerLeft] == 0 && flowerbed[previous] == 0 && pointerLeft != pointerRight {
                spaces += 1
                print("space on left", pointerLeft)
            } else if flowerbed[pointerLeft] == 0 && flowerbed[previous] == 1 {
                pointerLeft = previous
            }

            pointerLeft -= 2
        }


        if pointerRight < flowerbed.count {
            let next = pointerRight + 1 < flowerbed.count ? pointerRight + 1 : pointerRight - 1
            if flowerbed[pointerRight] == 0 && flowerbed[next] == 0 {
                spaces += 1
                print("space on right", pointerRight)
            } else if flowerbed[pointerRight] == 0 && flowerbed[next] == 1 {
                pointerRight = next
            }

            pointerRight += 2
        }

        counter -= 1
    }

    print(spaces)

    return n <= spaces
}

//canPlaceFlowers([0,0,1,0,0], 1)
//canPlaceFlowers([0,0], 2)
//canPlaceFlowers([0, 0, 0], 2)
//canPlaceFlowers([0,0,0,0], 2)
//canPlaceFlowers([1,0,1,0,0,1,0], 1)
//canPlaceFlowers([0], 1)
canPlaceFlowers([0,0,1,0,0,0,0,1,0,1,0,0,0,1,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0], 17)
