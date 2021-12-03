import Foundation

struct MyThing {
    subscript(_: Int) -> Int {
        return 3
    }
}

let testThing = MyThing()

print(testThing[8])
