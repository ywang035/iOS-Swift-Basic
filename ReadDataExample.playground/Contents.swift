import UIKit


/// mock up JSON
///
/// response data is a JSON object with array inside
let responseData = """
{
    "personList": [
        {
            "id": 1,
            "name": "Joe",
            "attribute": {
                "height": 100,
                "color": "blue"
            },
            "addition": [
                "swimming pool",
                "north facing",
                "gym"
            ]
        }
        ,
        {
            "id": 2,
            "name": "Bob",
            "attribute": {
                "height": 200,
                "color": "red"
            },
            "addition": [
                "air conditioning",
                "ensuite",
                "swimming pool"
            ]
        }
    ],
    "meta": "aaa"
}
""".data(using: .utf8)!


/// models
///
///  if data is not needed, just don't put it in the model
struct Response: Codable {
    var personList: [Person]
//    var meta: String
}

struct Person: Codable {
    var id: Int
    var name: String
//    var attribute: Attribute
    var addition: [String]
}

struct Attribute: Codable {
    var height: Int
    var color: String
}


/// decode JSON
do {
    let decodedData = try JSONDecoder().decode(Response.self, from: responseData)
    print(decodedData.personList[0].addition)
} catch let error as NSError {
    print("Failed to load: \(error.localizedDescription)")
}
