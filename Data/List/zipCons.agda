module Data.List.zipCons where

open import Data.List.Type
open import Data.List.map

-- Helper function to implement zipCons.
-- - xs: The list to be zipped with.
-- - yss: The list of lists to zip with xs.
-- = A new list of lists where each element of xs is prepended to the corresponding list in yss.
zipCons : ∀ {A : Set} → List A → List (List A) → List (List A)
zipCons [] ys = ys
zipCons (x :: xs) [] = (x :: []) :: map (λ y → y :: []) xs
zipCons (x :: xs) (y :: ys) = (x :: y) :: zipCons xs ys
