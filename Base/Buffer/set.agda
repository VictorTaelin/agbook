module Base.Buffer.set where

open import Base.Bool.Type
open import Base.Buffer.Type
open import Base.Maybe.Type
open import Base.Nat.Ord
open import Base.Nat.Type
open import Base.Pair.Type
open import Base.U64.Type
open import Base.U64.Ord
open import Base.Ord.Trait
import Base.OrdMap.insert as OrdMap

-- Set a value at an index in a buffer.
-- If this value is not a valid index, `None` is returned.
set : Buffer → (idx : U64) → (val : U64) → Maybe Buffer
set (MkBuffer length buffer) i v with ((primWord64ToNat i) < length)
... | True  = Some (MkBuffer length (OrdMap.insert (i , v) buffer))
... | False = None
