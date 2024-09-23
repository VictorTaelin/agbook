import { TreeBin, $Node, Node, $Leaf, Leaf } from '../../Base/TreeBin/Type';
import { Maybe } from '../../Base/Maybe/Type';

// Represents a Map as a TreeBin of Maybe values.
// - A: The type of values stored in the map.
export type Map<A> = TreeBin<Maybe<A>>;

// Export the tree constructors
export { $Node, Node, $Leaf, Leaf };
