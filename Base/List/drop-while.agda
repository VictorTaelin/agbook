module Base.List.drop-while where

open import Base.Bool.Type
open import Base.List.Type

-- Drops elements from the front of the list as long as they satisfy the predicate.
-- - fn: The predicate function.
-- - xs: The input list.
-- = A list containing the remaining elements after dropping the longest prefix of xs of elements that satisfy fn.
drop-while : ∀ {A : Set} → (A → Bool) → List A → List A
drop-while f [] = []
drop-while f (x :: xs) with f x
... | True  = drop-while f xs
... | False = x :: xs
