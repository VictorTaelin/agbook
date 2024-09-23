import { Tree } from '../../Base/Tree/Type';

// Fold operation for Tree.
// - f: Function to apply to each node.
// - z: Value to use for leaf nodes.
// - t: The tree to fold over.
// = The result of folding the tree.
export const $fold = <A, B>(f: (x: A, left: B, right: B) => B, z: B, t: Tree<A>): B => {
  switch (t.$) {
    case 'Leaf':
      return z;
    case 'Node':
      return f(t.val, $fold(f, z, t.lft), $fold(f, z, t.rgt));
  }
};

export const fold = <A, B>(f: (x: A, left: B, right: B) => B) => (z: B) => (t: Tree<A>) => $fold(f, z, t);
