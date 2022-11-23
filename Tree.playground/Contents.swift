
struct Queue<Element> {
    var elements: [Element] = []
    
    @discardableResult
    mutating func enqueue(_ value: Element) -> Bool {
        elements.append(value)
        return true
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

class TreeNode<T> {
    
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}

extension TreeNode where T: Equatable {
    
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enqueue($0)
        }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        
        return result
    }
}

let bevrages = TreeNode("Bevrages")

let hot =  TreeNode("Hot")
let cold = TreeNode("Cold")

let tea = TreeNode("Tea")
let coffee = TreeNode("Coffee")

hot.add(tea)
hot.add(coffee)

let soda = TreeNode("Soda")
let milk = TreeNode("Milk")

cold.add(soda)
cold.add(milk)

bevrages.add(hot)
bevrages.add(cold)

//bevrages.forEachDepthFirst {
//    print($0.value)
//}

//bevrages.forEachLevelOrder {
//    print($0.value)
//}

if let searchResult = bevrages.search("Milk") {
    print(searchResult.value)
}
 
