import { TreeBin, $Node, Node, $Leaf, Leaf } from '../TreeBin/Type';
import { Maybe } from '../Maybe/Type';

// Represents a BitMap as a TreeBin of Maybe values.
// - A: The type of values stored in the map.
export type BitMap<A> = TreeBin<Maybe<A>>;

// Export the tree constructors
export { $Node, Node, $Leaf, Leaf };
