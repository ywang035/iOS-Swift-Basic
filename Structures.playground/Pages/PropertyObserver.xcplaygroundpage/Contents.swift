
import Foundation

/// “ allows you to observe any property and respond to the changes in the property’s value.
/// These property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.”



struct StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
}
        }
    }
}


var stepCounter = StepCounter()
stepCounter.totalSteps = 10
stepCounter.totalSteps = 5
