// Defines a binary tree datatype.
// - A: The type of values stored in the tree.
export type BinTree<A>
  = { $: 'Node', val: A, lft: BinTree<A>, rgt: BinTree<A> }
  | { $: 'Leaf' };

export const $Node = <A>(val: A, lft: BinTree<A>, rgt: BinTree<A>): BinTree<A> => ({ $: 'Node', val, lft, rgt });
export const  Node = <A>(val: A) => (lft: BinTree<A>) => (rgt: BinTree<A>) => $Node(val, lft, rgt);

export const $Leaf: BinTree<never> = { $: 'Leaf' };
export const  Leaf: BinTree<never> = $Leaf;
