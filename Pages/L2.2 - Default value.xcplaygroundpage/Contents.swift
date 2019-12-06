import Foundation

var users = ["Ivan", "Mike", "Olga"]
var intrests = ["Car", "Football", "Flowers", nil]
var age = [21, 25, 15, 29]

func prettyPrint(name: String?, age: Int?, intrest: String?) {
    print("\(name ?? "Someone") is \(age ?? 0) and likes \(intrest ?? "something")")
}

// Solution 1: check bounds first
for i in 0..<intrests.count {
    prettyPrint(name: i < users.count ? users[i] : nil, age: age[i], intrest: intrests[i])
}

print("\n")

// Solution 2: use array extention
for i in 0..<intrests.count {
    prettyPrint(name: users[i, default: "Someone"], age: age[i], intrest: intrests[i])
}

extension Array {
    public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }
        return self[index]
    }
}
