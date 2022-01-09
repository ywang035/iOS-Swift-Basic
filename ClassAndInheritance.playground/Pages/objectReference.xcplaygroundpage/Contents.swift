import Foundation

// MARK: - class
class PersonA {
  let name: String
  var age: Int
 
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}
 
var jackA = PersonA(name: "Jack", age: 24)
var myFriendA = jackA
 
jackA.age += 1
 
print(jackA.age)
print(myFriendA.age)



// MARK: - struct
struct PersonB {
  var name: String
  var age: Int
}
 
var jackB = PersonB(name: "Jack", age: 24)
var myFriendB = jackB
 
jackB.age += 1
 
print(jackB.age)
print(myFriendB.age)
