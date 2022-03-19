import Foundation

// Supported characters by the display
let supportedChars: String = "abcdefghijlnoprstuyzABCDEFGHIJLNOPRSTUYZ0123456789.|-_°()[] "

// Characters that need to be replaced in order to be displayed correctly
let replaceDict = [
    "a": "A",
    "B": "b",
    "e": "E",
    "f": "F",
    "G": "g",
    "j": "J",
    "N": "n",
    "p": "P",
    "R": "r",
    "s": "S",
    "T": "t",
    "y": "Y",
    "z": "Z"
]

// Delete all unsupported chars
func cleanString (input: String) -> String {
    var result: String = input.filter(supportedChars.contains)

    for (key, value) in replaceDict {
        for character in key {
            result = result.replacingOccurrences(of: String(character), with: value)
        }
    }

    return result;
}

// Convert char to 7-segment binary code and add a period if needed
let periodCode: UInt8 = 0b10000000
func charToBinary (char: UInt8, setPeriod: Bool) -> UInt8 {
    var result: UInt8 = char

    // TODO map char code to 7-segment binary
    // once the display codes are final

    if setPeriod == true {
        result = result | periodCode
    }

    return result
}

// take the clean string and map it to a 7-segment binary array
func mapTo7segment (cleanInput: String) -> [UInt8] {
    let chars: [UInt8] = [UInt8](cleanInput.utf8)
    let result: [UInt8] = []

    for i in 0...chars.count-1 {
        // TODO check if the next char is a period and add it to the current one if so
        // TODO use charToBinary() function
        print(chars[i])
    }

    return result;
}
