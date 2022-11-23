
class BinaryNode<Element> {
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
    
    var min: BinaryNode { leftChild?.min ?? self }
}

extension BinaryNode: CustomStringConvertible {
    
    var description: String {
        diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?, _ top: String  = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node else { return root + "nil\n" }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + " ---", top + "| ")
    }
}

struct BinarySearchTree<Element: Comparable> {
    private(set) var root: BinaryNode<Element>?
    
    init() {}
}

extension BinarySearchTree {
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node else { return nil }
        
        if value == node.value {
            
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root else { return "Empty tree" }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node else { return BinaryNode(value: value) }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
            
        }
        
        return false
    }
}

var bst = BinarySearchTree<Int>()

bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

print(bst.contains(5))
