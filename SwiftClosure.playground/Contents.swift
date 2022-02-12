import UIKit

var greeting = "Hello, playground"


func compareInt(_ num1: Int, _ num2: Int) -> Int {
    
    var returnNum = 0
    
    returnNum = max(num1, num2)
    
    return returnNum
}



let largeNum = compareInt(1, 2)
print(largeNum)


var greet = { (name: String) in
    print("hello, \(name)")
}

greet("joe")



struct Person {
    var name: String
    var age: Int
}


let someone = Person(name: "joe", age: 30)


let theAgeDouble =  { age in
    
    age*2
    
}

print(theAgeDouble(someone.age))


var intArr = [1, 2, 3]

let intDoubleArr = intArr.flatMap { num in
    num*num
}

print(intDoubleArr)


intArr = [3, 1, 2]

let sortedArr = intArr.sorted {
    print("0: \($0), 1: \($1)")
    return $0 < $1
}


print(sortedArr)




struct Student {
    var name: String
    var age: Int?
}

var s1 = Student(name: "John", age: 10)


let largerThanZero = s1.age.flatMap { num in
    
    num > 0 ? true : nil
    
}

print(largerThanZero)



let stringArrs = ["joe", "june", "jack"]

let uppercaedArr = stringArrs.map { name -> String in
    print(name)
    return name.uppercased()
}

let uppercasedArr2 = stringArrs.map { $0.uppercased()}


print(uppercaedArr)

print(uppercasedArr2)



