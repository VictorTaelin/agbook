import { TreeBin, $Node, $Leaf } from '../../Base/TreeBin/Type';

// Merges two trees using combining functions.
// - a: Function to handle cases where only the first tree has a value.
// - b: Function to handle cases where only the second tree has a value.
// - ab: Function to combine values when both trees have a value.
// - t1: The first input tree.
// - t2: The second input tree.
// = A new tree where each node is the result of applying the appropriate
//   function based on the presence of values in t1 and t2.
export const $merge = <A, B, C>(
  a: (x: A) => C,
  b: (x: B) => C,
  ab: (x: A, y: B) => C,
  t1: TreeBin<A>,
  t2: TreeBin<B>
): TreeBin<C> => {
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

export const merge = <A, B, C>(a: (x: A) => C) => (b: (x: B) => C) => (ab: (x: A, y: B) => C) => (t1: TreeBin<A>) => (t2: TreeBin<B>) => $merge(a, b, ab, t1, t2);
