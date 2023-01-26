import UIKit

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {

    let char = letters.reduce(into: letters.max()) { partialResult, character in
        if character < partialResult! && character > target {
            partialResult = character
        }
    }

    return char! > target ? char! : letters[0]
}

nextGreatestLetter(["c","f","j"], "a")
nextGreatestLetter(["c","f","j"], "c")
nextGreatestLetter(["x","x","y","y"], "z")

