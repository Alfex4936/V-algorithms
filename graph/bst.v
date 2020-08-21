struct Tree {
    value int
mut:
    left &Tree
    right &Tree
}

/*
BST (Binary Search Tree)

1. its value is strictly greater than the values of every node to its left
2. its value is less than or equal to the values of every node to its right
*/
fn main() {
    mut tree := &Tree{value: 10, left: &Tree(0), right: &Tree(0)}  // root

    nodes := [5, 15, 2, 5, 13, 22, 1, 14]

    for node in nodes {
        tree.insert(node)
    }

    println(tree.value)  // 10
    println(tree.left.value)  // 5
    println(tree.left.right.value)  // 5
    println(tree.left.left.value)  // 2
    println(tree.left.left.left.value)  // 1

    println(tree.right.value)  // 15
    println(tree.right.left.value)  // 13
    println(tree.right.left.right.value)  // 14
    println(tree.right.right.value)  // 22
}

fn (mut t Tree) insert(val int) &Tree {
    // println(t.str())
    if val < t.value {
        if t.left.exist() {
            return t.left.insert(val)
        } else {
            t.left = &Tree{value: val, left: &Tree(0), right: &Tree(0)}
        }
    } else {
        if t.right.exist() {
            return t.right.insert(val)
        } else {
            t.right = &Tree{value: val, left: &Tree(0), right: &Tree(0)}
        }
    }

    return t
}

fn (t &Tree) exist() bool {
    if t == &Tree(0) {
        return false
    }
    return true
}

// Node print
fn (t &Tree) str() string {
        return 'Node {\n' +
    '   value: $t.value\n' +
    '   left: 0x${ptr_str(t.left)}\n' +
    '   right: 0x${ptr_str(t.right)}\n' +
    '}'
}