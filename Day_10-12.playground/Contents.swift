import UIKit

//MARK: - Day 10 (Classes)

// Creating own class

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

let poppy = Dog(name: "Poppy", breed: "Pug")

// Inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
         print("Yip!")
    }
}

let poodle = Poodle(name: "Poppy")
poodle.makeNoise()


// Final class

final class Animal {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Copying objects classes are passed/assigned ny reference

print(poodle.name)
var poppyBro = poodle
poppyBro.name = "Poppy Bro!"
print(poodle.name)
print(poppyBro.name)


// Deinitializers

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


//MARK: - Day 11 (Protocols)

protocol VoiceAssistant {
    var name: String {get}
    var voice: String {get set}
    var version: String {get}
}


struct Siri: VoiceAssistant {
    let name = "Siri" // Conforming to `VoiceAssistant`
    var voice = "Nikhit"
    var version = "1.0"
}

var myVoiceAssistant: VoiceAssistant = Siri()
myVoiceAssistant.voice = "Samantha"
//myVoiceAssistant.version = "2.0"  throws error since version is an get only property

//MARK: - Day 12 (Optionals)

var age: Int? = nil

age = 38
print(type(of: age))
print(age!)

// Unwrapping optionals
var name: String? = nil

name = "Nikhit"

if let name = name {
    print(name.count)
} else {
    print("Missing Name")
}

// Unwrapping with guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

greet(nil)


// Force Unwrapping

let str = "5"
let num = Int(str)
print(num, num!)

// Implicity unwrapped optionals

var ageF: Int! = 10
print(type(of: ageF))


// Nil coalescing operator

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"
print(user)

// Optional Chaining

let names:[String] = []
print(names.first?.uppercased())

// optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")


struct p {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

var P = p(id: "999999999")!
print(type(of: P))


// Typecasting

class ANimal { }
class Fish: ANimal { }

class DOg: ANimal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), DOg(), Fish(), DOg()]

print(type(of: pets))

let petOne = pets.first as? DOg
print(petOne)
