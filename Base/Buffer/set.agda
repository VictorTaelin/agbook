module Base.Buffer.set where

open import Base.Bool.Type
open import Base.Buffer.Type
open import Base.Maybe.Type
open import Base.Nat.Trait.Ord
open import Base.Nat.Type
open import Base.OrdMap.insert renaming (insert to ordmap-insert)
open import Base.Trait.Ord
open import Base.Pair.Type
open import Base.U64.Trait.Ord
open import Base.U64.Type
open import Base.U64.to-nat

-- Set a value at an index in a buffer.
-- If this value is not a valid index, `None` is returned.
set : Buffer → (idx : U64) → (val : U64) → Maybe Buffer
set (MkBuffer length buffer) i v with ((to-nat i) < length)
... | True  = Some (MkBuffer length (ordmap-insert (i , v) buffer))
... | False = None
