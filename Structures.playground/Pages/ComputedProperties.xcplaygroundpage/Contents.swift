import UIKit

/// allows a property to perform logic that returns a calculated value.

/// similar to use multiple init functions but easier

struct Temperature {
    var celsius: Double
    
    var fahrenheit: Double {
        celsius * 1.8 + 32
    }
    
    var kelvin: Double {
        celsius + 273.15
    }
}

let currentTemp = Temperature(celsius: 0.0)
currentTemp.fahrenheit
currentTemp.kelvin
