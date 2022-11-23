
struct Stack<Element> {
    
    private var storage: [Element] = []
    
    init() {}
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        
        let topDevider = "------Top------\n"
        let bottomDiveder = "\n----------"
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDevider + stackElements + bottomDiveder
    }
}


var stack = Stack<Int>()
stack.push(20)
stack.push(10)
stack.push(3)
stack.push(99)

print("before popping")
print(stack)

stack.pop()

print("after popping")
print(stack)
