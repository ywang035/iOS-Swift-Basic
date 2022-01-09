import Foundation


///“to update the property values of a structure within an instance method.”

struct Meter {
    var value: Int = 0
    
    mutating func increment() {
        value += 1
    }
    
    mutating func increment(by amount: Int) {
        value += amount
    }
    
    mutating func reset() {
        value = 0
    }
}

var meter = Meter()
meter.increment()
meter.increment(by: 2)
meter.reset()
