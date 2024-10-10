module Base.BinMap.take where

open import Base.BinMap.BinMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.Maybe.map
open import Base.BinTree.BinTree
open import Base.Pair.Pair

-- Retrieves and removes a value from the BinMap given a key.
-- - m: The BinMap to search in and remove from.
-- - k: The Bits key to look up and remove.
-- = Maybe containing a pair of the new BinMap and the value if the key existed, None otherwise.
take : ∀ {A : Set} → BinMap A → Bits → Maybe (Pair (BinMap A) A)
take (Node (Some x) lft rgt) E     = Some ((Node None lft rgt) , x)
take (Node None     lft rgt) E     = None
take (Node val      lft rgt) (O k) = map (λ { (new-lft , v) → (Node val new-lft rgt) , v }) (take lft k)
take (Node val      lft rgt) (I k) = map (λ { (new-rgt , v) → (Node val lft new-rgt) , v }) (take rgt k)
take Leaf                    _     = None

