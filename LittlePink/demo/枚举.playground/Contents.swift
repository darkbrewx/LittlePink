import UIKit

// MARK:  - 语法
//enum CompassPoint {
//    case north
//    case south
//    case east
//    case west
//}

var directionToHead: CompassPoint = .east
directionToHead = .north

// MARK: - 遍历
enum Beverage: CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

// MARK: - 原始值 Raw Values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
ASCIIControlCharacter.tab.rawValue


enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3

enum CompassPoint: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"

let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus


// MARK: - 关联值 Associate

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")


switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
