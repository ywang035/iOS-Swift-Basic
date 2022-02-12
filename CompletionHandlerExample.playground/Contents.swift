import UIKit

// MARK: - completion handler without parameter
func handler1(completion: () -> Void) {
    print("### handler 1 func starts ###")

    completion()

    print("### handler 1 func finishes ###")
}


handler1() {
    print("testing")
}


// MARK: - completino handler with parameter
func handler2(message: String, completion: (String) -> Void) {
    print("\n ### handle 2 func starts ###")

    print("message: \(message)")

    completion("processed input message")

    print("### handle 2 func finishes ###")
}


handler2(message: "input message") { result in
    print("result: \(result)")
}


// MARK: - completion handler with result type
enum NumberError: Error {
    case lowerThanRequire
}


func handler3(num: Int, completion: (Result<String, NumberError>) -> Void) {
    print("\n### handler 3 func starts ###")

    if num > 10 {
        completion(.success("greater than 10"))
    } else {
        completion(.failure(.lowerThanRequire))
    }

    print("### handler 3 func finishes ###")
}


handler3(num: 9) { result in
    switch result {
    case .success(let message):
        print(message)
    case .failure(let error):
        print(error.self)
    }
}




// MARK: - completion handler with a return
let username = "aaa@"

func usernameValidationService(_ username: String) -> Bool {
    return username.contains("@")
}

func handler4(username: String, completion: @escaping (Bool) -> String) {
    print("\n### handler 4 func starts")

    let validationResult: Bool = usernameValidationService(username)

    let usernameResult: String = completion(validationResult)

    print(usernameResult)

    print("### handler 4 func finsihes")
}

handler4(username: username) { result in
    return result ? "username is good" : "try again"
}



// MARK: - completion handler with delay
let password = "666"

func passwordValidationService(password: String, completion: @escaping (Bool) -> Void) {
    print("\n### start checking password ###")

    /// to simulate server result with delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
        let validate = password.count > 5

        completion(validate)
    })

    print("### finish checking password ###")
}


func presentResult() {
    passwordValidationService(password: password) { result in
        /// this closure is the call back function
        if result {
            print("password is good")
        } else {
            print("password is weak")
        }
    }
}

presentResult()

