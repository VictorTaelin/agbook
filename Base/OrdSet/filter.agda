module Base.OrdSet.filter where

open import Base.OrdSet.OrdSet
open import Base.OrdSet.fold
open import Base.OrdSet.empty
open import Base.OrdSet.insert
open import Base.Pair.Pair
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Unit.Unit
open import Base.Trait.Ord

-- Filters an OrdSet based on a predicate function.
-- - pred: The predicate function to test each key-value pair.
-- - oset: The input OrdSet.
-- = A new OrdSet containing only elements that satisfy the predicate.
filter : ∀ {V : Set} → {{_ : Ord V}} → (V → Bool) → OrdSet V → OrdSet V
filter pred = fold (λ v acc → if pred v then v ::> acc else acc) empty
