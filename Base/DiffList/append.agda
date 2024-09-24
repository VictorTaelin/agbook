module Base.DiffList.append where

open import Base.DiffList.Type
open import Base.List.Type
open import Base.List.append using (_++_)

-- Concatenates two DiffLists.
-- - xs: The first DiffList.
-- - ys: The second DiffList.
-- = A new DiffList containing all elements from xs and ys.
append : ∀ {A : Set} -> DiffList A -> DiffList A -> DiffList A
append xs ys = λ tail -> (xs (ys tail))
