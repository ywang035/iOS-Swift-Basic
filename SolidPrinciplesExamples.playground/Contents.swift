import UIKit


/* 1. Single Responsibility

 One class should only serve one purpose. All the methods and properties should work towards the same goal.

 */

/// One responsibility in one class
struct Person {
    let name: String
    let age: Int
}

/// another responsibility in another class
struct AgeVerifier {
    func checkAge(age: Int) -> String {
        if age < 8 {
            return "Underage"
        } else {
            return "Qualified"
        }
    }
}

let person = Person(name: "Lexton", age: 1)
let verifyAge = AgeVerifier()
verifyAge.checkAge(age: person.age)



/* 2. Open-closed Principle

 Entities (classes, modules, functions, etc.) should be open of extension and closed for modification.

 */

protocol Animal {
    func numberOfLegs() -> Int
}

protocol Swimmable {
    func canSwim() -> Bool
}

protocol Barkable {
    func canBark() -> Bool
}

class Tiger: Animal, Swimmable {
    func numberOfLegs() -> Int {
        return 4
    }
    func canSwim() -> Bool {
        return false
    }
}

class Duck: Animal, Swimmable {
    func numberOfLegs() -> Int {
        return 2
    }
    func canSwim() -> Bool {
        return true
    }
}

class Dog: Animal, Swimmable, Barkable {
    func numberOfLegs() -> Int {
        return 4
    }

    func canSwim() -> Bool {
        return true
    }

    func canBark() -> Bool {
        return true
    }
}



/* 3. Liskov Substitution Principle(LSP)

 Subclass/derived class should be substitutable for their base/parent class.

 */

class Rectangle {
    var width: Int!
    var height: Int!
    func setWidth(width: Int) {
        self.width = width
    }
    func setHeight(height: Int) {
        self.height = height
    }
    func area() -> Int {
        return self.width * self.height
    }
}

class Square: Rectangle {
    override func setWidth(width: Int) {
        self.width = width
    }
    override func setHeight(height: Int) {
        self.height = height
    }
    override func area() -> Int {
        return self.width * self.width
    }
}


let myRect = Rectangle()
myRect.setWidth(width: 10)
myRect.setHeight(height: 5)
print(myRect.area())


let mySquare = Square()
mySquare.setWidth(width: 10)
mySquare.setHeight(height: 5)
print(mySquare.area())

// As the formula for calculating area for Rectangle is different from Square, Square should not be subclassed from Rectangle. Though Rectangle and Square share one common characteristic, which is both have four sides. So both suppose to inherit from a class called Quadrilateral(Shape with four sides).



/* 4.Interface Segregation Principle (see principle 2)

 Whenever a class follows a protocol it implements all of it’s methods.

 */



/* 5. Dependency Inversion Principle

 High-level modules should not directly depend on low-level modules, both should depend on abstractions.

 */


// Dependency Injection
struct NetworkService1 {
    func getName() -> String{
        let result = "Joe"
        return result
    }
}

struct NamePresenter1 {
    let ns = NetworkService1()

    func shouldPresentName() {
        print("presenter1 directly depends on network service1, name is \(ns.getName())")
    }
}

let np1 = NamePresenter1()
np1.shouldPresentName()



// Dependency Injection -> not good
protocol NetworkServiceProtocol2 {
    func getName() -> String
}


struct NetworkService2: NetworkServiceProtocol2 {
    func getName() -> String{
        let result = "Joe"
        return result
    }
}

struct NamePresenter2 {
    let ns: NetworkServiceProtocol2

    func shouldPresentName() {
        print("presenter2 depends on network service2, name is \(ns.getName())")
    }
}


let np2 = NamePresenter2(ns: NetworkService2())
np2.shouldPresentName()



// Dependency Inversion
protocol GetNameProtocol3 {
    func getName() -> String
}

struct NetworkService3: GetNameProtocol3 {
    func getName() -> String{
        let result = "Joe"
        return result
    }
}

struct NamePresenter3 {
    let ns: GetNameProtocol3

    func shouldPresentName() {
        print("presenter3 with network service3, name is \(ns.getName())")
    }
}

let np3 = NamePresenter3(ns: NetworkService3())
np3.shouldPresentName()




// MARK: another example
class Handler {
    let storage: Storage

    init (storage: Storage) {
        self.storage = storage
    }

    func handle(message: String) {
        storage.save(message: "saving")
    }
}


protocol Storage {
    func save(message: String)
}


class FileSystemManager: Storage {
    func save(message: String) {

    }
}


class DatabaseManager: Storage {
    func save(message: String) {

    }
}
