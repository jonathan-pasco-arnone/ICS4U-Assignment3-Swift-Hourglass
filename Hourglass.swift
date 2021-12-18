/*
* This program makes an hourglass.
*
* @author  Jonathan Pasco-Arnone
* @version 1.0
* @since   2021-12-15
*/

// Making an error case.
enum MyError: Error {
    case invalidInteger(String)
}

// Makes and prints the hourglass
func hourglass(sand: Int, centre: Int) throws {
    var hourglassStr = ""
    for _ in 0..<centre {
        hourglassStr += " "
    }

    for _ in 0..<sand {
        hourglassStr += "* "
    }
    print(hourglassStr)

    if sand > 1 {
        try hourglass(sand: (sand - 1), centre: (centre + 1))
    }
    print(hourglassStr)
}

let invalidInputStr = "\nInvalid Input"

print("Hourglass")
print("\nPlease input a number greater than 1: ")

do {
    let sandInput = readLine()
    if let sand = Int(sandInput!) {

        print("")
        if sand > 1 {
            // Process.
            try hourglass(sand: sand, centre: 0)
        } else {
            print(invalidInputStr)
        }

    } else {
        /*
        * This throws an error out of the called function
        * and activates the catch statement.
        */
        throw MyError.invalidInteger("Error")
    }
} catch {
    print(invalidInputStr)
}
print("\nDone.")
