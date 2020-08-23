struct Tree {
	value int
mut:
	left  &Tree = &Tree(0)
	right &Tree = &Tree(0)
}

/*
BST (Binary Search Tree)

1. its value is strictly greater than the values of every node to its left
2. its value is less than or equal to the values of every node to its right
*/
fn main() {
	mut tree := &Tree{
		value: 30
	} // root
	nodes := [15, 60, 7, 22, 45, 75, 17, 27]
	for node in nodes {
		tree.insert(node)
	}
	println(tree.value) // 30
	println(tree.left.value) // 15
	println(tree.left.right.value) // 22
	println(tree.left.right.right.value) // 27
	println(tree.left.right.left.value) // 17
	println(tree.left.left.value) // 7
	println(tree.right.value) // 60
	println(tree.right.left.value) // 45
	println(tree.right.right.value) // 75
}

fn (mut t Tree) insert(val int) &Tree {
	// println(t.str())
	if val < t.value {
		if t.left.exist() {
			return t.left.insert(val)
		} else {
			t.left = &Tree{
				value: val
			}
		}
	} else {
		if t.right.exist() {
			return t.right.insert(val)
		} else {
			t.right = &Tree{
				value: val
			}
		}
	}
	return t
}

fn (t &Tree) exist() bool {
	if t == &&Tree(0) {
		return false
	}
	return true
}

// Node print
fn (t &Tree) str() string {
	return 'Node {\n' + '   value: $t.value\n' + '   left: 0x${ptr_str(t.left)}\n' + '   right: 0x${ptr_str(t.right)}\n' +
		'}'
}
