import { BinTree } from '../../Base/BinTree/Type';

// Fold operation for BinTree.
// - f: Function to apply to each node.
// - z: Value to use for leaf nodes.
// - t: The tree to fold over.
// = The result of folding the tree.
export const $fold = <A, B>(f: (x: A, left: B, right: B) => B, z: B, t: BinTree<A>): B => {
  switch (t.$) {
    case 'Leaf':
      return z;
    case 'Node':
      return f(t.val, $fold(f, z, t.lft), $fold(f, z, t.rgt));
  }
};

export const fold = <A, B>(f: (x: A, left: B, right: B) => B) => (z: B) => (t: BinTree<A>) => $fold(f, z, t);
