import { BinTree, $Node, $Leaf } from '../../Base/BinTree/BinTree';

// Merges two trees using combining functions.
// 1st: Function to handle cases where only the first tree has a value.
// 2nd: Function to handle cases where only the second tree has a value.
// 3rd: Function to combine values when both trees have a value.
// 4th: The first input tree.
// 5th: The second input tree.
// = A new tree where each node is the result of applying the appropriate
//   function based on the presence of values in both input trees.
export const $merge = <A, B, C>(
  a: (x: A) => C,
  b: (x: B) => C,
  ab: (x: A, y: B) => C,
  t1: BinTree<A>,
  t2: BinTree<B>
): BinTree<C> => {
  switch (t1.$) {
    case 'Leaf':
      switch (t2.$) {
        case 'Leaf':
          return $Leaf;
        case 'Node':
          return $Node(
            b(t2.val),
            $merge(a, b, ab, $Leaf, t2.lft),
            $merge(a, b, ab, $Leaf, t2.rgt)
          );
      }
    case 'Node':
      switch (t2.$) {
        case 'Leaf':
          return $Node(
            a(t1.val),
            $merge(a, b, ab, t1.lft, $Leaf),
            $merge(a, b, ab, t1.rgt, $Leaf)
          );
        case 'Node':
          return $Node(
            ab(t1.val, t2.val),
            $merge(a, b, ab, t1.lft, t2.lft),
            $merge(a, b, ab, t1.rgt, t2.rgt)
          );
      }
  }
};

export const merge = <A, B, C>(a: (x: A) => C) => (b: (x: B) => C) => (ab: (x: A, y: B) => C) => (t1: BinTree<A>) => (t2: BinTree<B>) => $merge(a, b, ab, t1, t2);
