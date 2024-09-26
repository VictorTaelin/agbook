module Base.Buffer.set where

open import Base.Bool.Bool
open import Base.Buffer.Buffer
open import Base.Maybe.Maybe
open import Base.Nat.Trait.Ord
open import Base.Nat.Nat
open import Base.OrdMap.insert renaming (insert to ordmap-insert)
open import Base.Trait.Ord
open import Base.Pair.Pair
open import Base.U64.Trait.Ord
open import Base.U64.U64
open import Base.U64.to-nat

-- Set a value at an index in a buffer.
-- If this value is not a valid index, `None` is returned.
set : Buffer → (idx : U64) → (val : U64) → Maybe Buffer
set (MkBuffer length buffer) i v with ((to-nat i) < length)
... | True  = Some (MkBuffer length (ordmap-insert (i , v) buffer))
... | False = None
