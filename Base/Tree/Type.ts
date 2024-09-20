// Defines a binary tree datatype.
// - A: The type of values stored in the tree.
export type Tree<A>
  = { $: 'Node', val: A, lft: Tree<A>, rgt: Tree<A> }
  | { $: 'Leaf' };

export const $Node = <A>(val: A, lft: Tree<A>, rgt: Tree<A>): Tree<A> => ({ $: 'Node', val, lft, rgt });
export const  Node = <A>(val: A) => (lft: Tree<A>) => (rgt: Tree<A>) => $Node(val, lft, rgt);

export const $Leaf = <A>(): Tree<A> => ({ $: 'Leaf' });
export const  Leaf = <A>() => $Leaf<A>();