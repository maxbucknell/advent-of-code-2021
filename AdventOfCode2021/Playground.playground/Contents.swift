import Cocoa

struct MySequence<S: Sequence> where S.Element == String {
    let input: S
    
    init(input: S) {
        self.input = input
    }
    
    func run() {
        for s in input {
            print("value: \(s)")
        }
    }
}

let seq = MySequence(input: ["hello", "world"])

seq.run()
