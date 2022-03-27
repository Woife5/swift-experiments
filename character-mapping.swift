import Foundation

// Supported characters by the display
let supportedChars: String = "abcdefghijlnoprstuyzABCDEFGHIJLNOPRSTUYZ0123456789.|-_°()[] "

let characterMap: [Character: UInt8] = [
  "b" : 0b01111100,
  "c" : 0b01011000,
  "d" : 0b01011110,
  "G" : 0b00111101,
  "h" : 0b01110100,
  "i" : 0b00010000,
  "n" : 0b01010100,
  "o" : 0b01011100,
  "r" : 0b01010000,
  "t" : 0b01111000,
  "u" : 0b00011100,
  "A" : 0b01110111,
  "C" : 0b00111001,
  "E" : 0b01111001,
  "F" : 0b01110001,
  "H" : 0b01110110,
  "I" : 0b00110000,
  "J" : 0b00011111,
  "L" : 0b00111000,
  "P" : 0b01110011,
  "U" : 0b00111110,
  "Y" : 0b01101110,
  "0" : 0b00111111,
  "1" : 0b00000110,
  "2" : 0b01011011,
  "3" : 0b01001111,
  "4" : 0b01100110,
  "5" : 0b01101101,
  "6" : 0b01111101,
  "7" : 0b00000111,
  "8" : 0b01111111,
  "9" : 0b01101111,
  "-" : 0b01000000,
  "_" : 0b00001000,
  "\"" : 0b00100010,
  "\\" : 0b00000010,
  "°" : 0b01100011,
  ")" : 0b00001111,
  " " : 0b00000000,
]

// Characters that need to be replaced in order to be displayed correctly
let replaceDict = [
    "a": "A",
    "B": "b",
    "e": "E",
    "f": "F",
    "g": "G",
    "j": "J",
    "N": "n",
    "p": "P",
    "R": "r",
    "s": "S",
    "T": "t",
    "y": "Y",
    "z": "Z",
    "sS": "5",
    "zZ": "2",
    "([c": "C",
    "]": ")",
    "|i": "I",
    "O": "0",
    "l": "L"
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
func charToBinary (char: Character, setPeriod: Bool) -> UInt8 {
    var result: UInt8 = characterMap[char] ?? 0b00000000

    if setPeriod == true {
        result = result | 0b10000000
    }

    return result
}

// take the clean string and map it to a 7-segment binary array
func mapTo7segment (cleanInput: String) -> [UInt8] {
    let chars: [Character] = Array(cleanInput)
    var result: [UInt8] = []

    var i = 0
    while i < chars.count {
        if i < chars.count - 1 && chars[i+1] == "." {
            result.append(charToBinary(char: chars[i], setPeriod: true))
            i += 1
        } else {
            result.append(charToBinary(char: chars[i], setPeriod: false))
        }
        i += 1
    }

    return result;
}

print(mapTo7segment(cleanInput: cleanString(input: "hallo.")))
