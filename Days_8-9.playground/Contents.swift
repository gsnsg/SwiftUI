import UIKit

//MARK: - Day 8 (Structs)

// Creating a simple struct

struct Sport {
    var name: String
}

var tennis =  Sport(name: "Tennis")
print(tennis.name)


tennis.name = "Hola, Mikkel!"


// Computed Properties

struct OlympicSport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}


var sport = OlympicSport(name: "Cricket", isOlympicSport: false)
print(sport.olympicStatus)


// Property Observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("Progressed from \(oldValue) to \(amount)")
        }
        
        willSet {
            print("Progress wil change from \(amount) to \(newValue)")
        }
    }
}

var progress = Progress(task: "ToDo", amount: 10)
progress.amount = 20
progress.amount = 30


// Methods in struct
struct City {
    var population: Int
    
    // mutatimng keyword is used when the method want to change a property of the struct
     mutating func increasePopulation(amount: Int) {
        self.population += amount
    }
}

var city = City(population: 10_000)
print(city.population)
city.increasePopulation(amount: 10_000)
print(city.population)

// String methods

let string = "Do or do not, there is no try."

print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.lowercased())
print(string.sorted())

// Arrays properties and methods
var toys = ["Woody", "Billy"]
print(toys.count)

toys.append("Buzz")
toys.append("Buzz")


print(toys.firstIndex(of: "Buzz") ?? """
    No instances of "Buzz" found
    """)


//MARK: - Day 9 (Structs)


// Initializers

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "two straws"


// Self keyword

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var person = Person(name: "Nikhit")


// Lazy Properties

struct FamilyTree {
    var familyName: String
    init() {
        print("Creating family tree!")
        self.familyName = "Hoshinaru"
    }
}

struct Persona {
    var name: String
    // Lazy keyword will help create the familtyTree object when it is first accessed
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Persona(name: "ed")


// Static Properties

struct Student {
    static var classSize = 100
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

print(Student.classSize)


// Access Control

struct Citizen {
    private var ssn: String

    init(ssn: String) {
        self.ssn = ssn
    }
    
    func printMySSN() {
        print("My SSN is \(self.ssn)")
    }
}
var citizen = Citizen(ssn: "28GHFIU8F")
citizen.printMySSN()
