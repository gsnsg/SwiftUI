import UIKit

//MARK: - Day 4 (Loops)

// For loop

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}


// While Loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

// Repeat Loop

number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

repeat {
    print("This is false")
} while false


// Exiting Loops
var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")

countDown = 10
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

// Breaking Multiple loops

for i in 1...3 {
    outerLoop: for j in 1...3 {
        for k in 1...2 {
            let product = i * j * j
            print ("\(i) * \(j)  * \(k) is \(product)")

            if product == 18 {
                print(i, j, k)
                print("It's a bullseye!")
                break outerLoop
            }
        }
        
    }
}


//MARK: - Day 5 (Funtions)

// Writing functions

func printHelp() {
    let message = """
Welcome to MyApp!
Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}
printHelp()


func square(num: Int) -> Int {
    return num * num
}

print(square(num: 2))


func sayHello(to name: String) {
    print("Hello, \(name)!")
}


sayHello(to: "Nikhit")


func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Nikhit")


func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Nikhit")
greet("Nikhit", nicely: false)

// Variadic functions

func greetAll(persons: String...) {
    for person in persons {
        greet(person)
    }
}

greetAll(persons: "Nikhit", "Sujan", "Hruthik")


// Throwing Functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
} catch {
    print(error)
}


// inout parameters

func change(num1: inout Int, num2: inout Int) {
    num1 += 10
    num2 *= 20
    
}

var num1 = 19
var num2  = 23
change(num1: &num1, num2: &num2)

print(num1, num2)


//MARK: - Day 6 and 7 (Closures)

// Simple closure

let driving = {
    print("I'm dirving my jeep")
}

// CLosure with Parameters
let drivingDesc = { (place: String) in
    print("I'm dirving to \(place)")
}

driving()
drivingDesc("London")


// Closure with return values

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("Alpha Centauri")
print(message)

// Closures as parameters

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

// Trailing Closures
travel {
    print("I'm dirving my jeep")
}

// Traling Closures with parameters
func travelAction(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("mars")
    print("I arrived!")
}

travelAction { (place: String) in
    print("I'm dirving to \(place)")
}

// tailing closures with return parameters

func travelReturn(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travelReturn { (place: String) -> String in
    return "I'm going to \(place) in my car"
}


// With multiple parameters

func travelMultiple(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travelMultiple {
    return "I'm going to \($0) at \($1) miles per hour"
}


// Return closures from functions

func returnClosure() -> (String) -> Void {
    return  {
        print("City Name: \($0)")
    }
}

let closure = returnClosure()
closure("London")
