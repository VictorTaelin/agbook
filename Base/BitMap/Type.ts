import { BinTree, $Node, Node, $Leaf, Leaf } from '../BinTree/Type';
import { Maybe } from '../Maybe/Type';

// Represents a BitMap as a BinTree of Maybe values.
// - A: The type of values stored in the map.
export type BitMap<A> = BinTree<Maybe<A>>;

// Export the tree constructors
export { $Node, Node, $Leaf, Leaf };
