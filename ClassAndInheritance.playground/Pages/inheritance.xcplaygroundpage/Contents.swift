import Foundation
import UIKit

/// The biggest difference between structures and classes is that classes can have hierarchical relationships.

/// subclasses inherit properties and methods from superclasses. However, subclasses can augment or replace the implementation of superclass properties and methods

// MARK: - super class
class Vehicle {
    var currentSpeed: Double = 0.0
    
    var description: String {
        "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing
        // an arbitrary vehicle doesn't make a noise
        // will be customized by subclass
    }
}


let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

/// The Vehicle class defines common characteristics, like properties and methods, for any type of vehicle–like cars, bicycles, or airplanes.

/// It is not very useful on it’s own, but it will make it easier to define other more specific types.

// MARK: - subclass
class Bicycle: Vehicle {
    var hasBasket = false
}

let bike = Bicycle()
bike.hasBasket = true
bike.currentSpeed = 15.0
print("Bicycle: \(bike.description)")

/// subclass can be sub-classed


// MARK: override methods and properties
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo!")
    }
}

let train = Train()
train.makeNoise()


// MARK: override initializer
class Person {
  let name: String
 
  init(name: String) {
    self.name = name
  }
}


class Student: Person {
    var favoriteSubject: String
    
    init(name: String, favoriteSubject: String) {
        self.favoriteSubject = favoriteSubject
        super.init(name: name)
    }
}
