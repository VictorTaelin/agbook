import { Tree, $Node, Node, $Leaf, Leaf } from '../../Base/Tree/Type';
import { Maybe } from '../../Base/Maybe/Type';

// Represents a Map as a Tree of Maybe values.
// - A: The type of values stored in the map.
export type Map<A> = Tree<Maybe<A>>;

// Export the tree constructors
export { $Node, Node, $Leaf, Leaf };
