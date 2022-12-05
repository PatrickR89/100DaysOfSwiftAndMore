import UIKit

func canWinNim(_ n: Int) -> Bool {

    return !(n % 4 == 0)
}

canWinNim(1)
canWinNim(2)
canWinNim(4)
canWinNim(40)
canWinNim(8763487)
