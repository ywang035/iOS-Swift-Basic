import Foundation
import UIKit


var string = String() // String.init()
var integer = Int() // Int.init()
var bool = Bool() // Bool.init()


// MARK: - default init
struct Odometer {
  var count: Int = 0
}
 
var odometer = Odometer()
print(odometer.count)


// MARK: - memberwise init
odometer = Odometer(count: 27000)
print(odometer.count)



// MARK: - custom init
struct Temperature {
    var celsius: Double
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    
    init(fahrenheit: Double) {
        self.celsius = (fahrenheit - 32) / 1.8
    }
    
    init(kelvin: Double) {
        self.celsius = kelvin - 273.15
    }
    
    init() {
        self.celsius = 0
    }
}


let currentTemperature = Temperature(celsius: 18.5)
let boiling = Temperature(fahrenheit: 212.0)
let absoluteZero = Temperature(kelvin: 0.0)
let freezing = Temperature()
