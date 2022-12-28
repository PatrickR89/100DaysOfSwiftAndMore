import UIKit

func checkRecord(_ s: String) -> Bool {

    var absence = 0
    var late = 0

    for char in s {

        switch char {
        case "L":
            late += 1
            if late == 3 {
                return false
            }
        case "A":
            absence += 1
            late = 0
            if absence == 2 {
                return false
            }
        default:
            late = 0
        }
    }

    return true
}

checkRecord("PPALLP")
checkRecord("PPALLL")
checkRecord("PPAPPAALLAAA")
