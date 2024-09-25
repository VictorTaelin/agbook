import { BinTree } from '../../Base/BinTree/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';
import { Show } from '../../Base/Trait/Show';

// Converts a binary tree to a string representation.
// 1st: The show function for type A.
// 2nd: The tree to convert to a string.
// = A string representation of the tree.
export const $show = <A>(show_a: Show<A>, tree: BinTree<A>): String => {
  switch (tree.$) {
    case 'Leaf':
      return '_';
    case 'Node':
      return (
        $append('{',
        $append(show_a.to_string(tree.val),
        $append(', ',
        $append($show(show_a, tree.lft),
        $append(', ',
        $append($show(show_a, tree.rgt),
        '}')))))));
  }
};

export const show = <A>(show_a: Show<A>) => (tree: BinTree<A>) => $show(show_a, tree);
