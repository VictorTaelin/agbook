// Defines a binary tree datatype.
// A: The type of values stored in the tree.
export type BinTree<A>
  = { $: 'Node', val: A, lft: BinTree<A>, rgt: BinTree<A> }
  | { $: 'Leaf' };

// Creates a new Node in the binary tree.
// 1st: The value to store in the node.
// 2nd: The left subtree.
// 3rd: The right subtree.
// = A new Node containing the given value and subtrees.
export const $Node = <A>(val: A, lft: BinTree<A>, rgt: BinTree<A>): BinTree<A> => ({ $: 'Node', val, lft, rgt });
export const  Node = <A>(val: A) => (lft: BinTree<A>) => (rgt: BinTree<A>) => $Node(val, lft, rgt);

// Represents an empty tree (Leaf).
export const $Leaf: BinTree<never> = { $: 'Leaf' };
export const  Leaf: BinTree<never> = $Leaf;
