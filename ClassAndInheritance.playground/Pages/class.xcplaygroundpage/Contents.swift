
import Foundation


/// Classes are very similar to structures. Among other similarities, both can define properties to store values, define methods to provide functionality, and define initializers to set up their initial state.


class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greeting() {
        print("Hello, my name is \(name)")
    }
}


let person = Person(name: "Joe")
person.greeting()
