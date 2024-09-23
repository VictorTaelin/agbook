import { Tree } from '../../Base/Tree/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';
import { Show } from '../../Base/Trait/Show';

export const $show = <A>(show_a: Show<A>, tree: Tree<A>): String => {
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

export const show = <A>(show_a: Show<A>) => (tree: Tree<A>) => $show(show_a, tree);
