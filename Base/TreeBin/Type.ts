// Defines a binary tree datatype.
// - A: The type of values stored in the tree.
export type TreeBin<A>
  = { $: 'Node', val: A, lft: TreeBin<A>, rgt: TreeBin<A> }
  | { $: 'Leaf' };

export const $Node = <A>(val: A, lft: TreeBin<A>, rgt: TreeBin<A>): TreeBin<A> => ({ $: 'Node', val, lft, rgt });
export const  Node = <A>(val: A) => (lft: TreeBin<A>) => (rgt: TreeBin<A>) => $Node(val, lft, rgt);

export const $Leaf: TreeBin<never> = { $: 'Leaf' };
export const  Leaf: TreeBin<never> = $Leaf;
