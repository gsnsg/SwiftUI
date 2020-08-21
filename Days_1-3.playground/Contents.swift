import UIKit

var str = "Hello, playground"

//MARK: - Day 1

// variables
var name = "Nikhit"
print("Hello \(name)!")

// Strings
var city = "Visakhapatname"
var num = 8_00_000
print(type(of: city))
print(type(of: num))

// Multiline Strings are started with """ and ended with """

var text = """
Hello there,\
how are you doing ?
"""
print(text)


// Doubles and Booleans
var pi = 3.141
print(type(of: pi))
var awesome  = true
print(type(of: awesome))

// String Interpolation
print("Value of pi is \(pi)")

// Constants are declared using let keyword
let country = "India"

// Type annontations
var mul: Int = 10
print(mul)


//MARK: - Day 2

// Arrays

let names: [String] = ["Monica", "Ross", "Phoebe", "Rachel", "Chandler", "Joey"]


print(names.first!) // Prints optional string
print(names.first ?? "Array is Empty") // If array is empty prints the array is empty else prints unwrapped optional
print(names.last ?? "Array is Empty")

// In Sets all items are unique and arranged in an random order

let namesSet = Set(names)
print(namesSet.first!) // Force unwrapping since I am sure the set has atleast one element


// Tuples
var add = (city: "Vizag", country: "India")
print(add.city)
//add = (city: "Vizag", hold_up: "25")
//print(add) throws error

// Dictionaries
let counts: [String:Int] = [
    "Nikhit" : 1,
    "Mukesh" : 2,
    "Sumanth" : 3
]
print(counts["Nikhit"] ?? "Key not found")

print(counts["Charlotte", default: 0])


// Creating emtpy collections
var words = [String]() // Emtpy array
var wordsSet = Set<String>() // Empty set
var wordsDict = [String : String]() // Empty dictionary
var dict = Dictionary<String, Int>() // Another way of creating dictionaries


// Enums

enum Result {
    case failure
    case success
}
let result = Result.failure
switch(result) {
case .failure:
    print("Failed :(")
case .success:
    print("Success!")
}

// Enums with associated values
enum Activity {
    case walking
    case talking
    case hiking(location: String)
    case running(miles: Double)
}

let activity = Activity.hiking(location: "Big Sur")

switch(activity) {
case .walking, .talking:
    print("Walking or talking")
    
case .hiking(location: let location):
    print("Hking at \(location)!")
case .running(miles: let miles):
    print("\(miles) miles ran and a few more to go!")
}

// Enum raw values

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)


enum Planets: Int {
    case mercury = 1
    case venus // 2
    case earth // 3
    case mars // 4
}


//MARK: - Day 3 Operators

// Arithmetic operators
let firstScore = 23
let secondScore = 19

let sum = firstScore + secondScore
let product = firstScore * secondScore
let division = firstScore / secondScore // gives 1 does'nt give floating point values since both are Int
let remained = firstScore % secondScore

// Operator Overloading

let firstHalf = ["John", "Cena"]
let secondHalf = ["Rob", "Dial"]
let total = firstHalf + secondHalf

// Compound assignment operators
var nums = 10
nums -= 9
nums += 23


// Comparison operators
firstScore <= secondScore
firstScore != secondScore

// Condtionals
if firstScore < 30 {
    print("< 30")
} else if firstScore < 40 {
    print("< 40")
} else {
    print("> 40")
}

// ternary Operator
print((firstScore > secondScore ? "1" : "2"))

// Switch block

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// Range operator
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
