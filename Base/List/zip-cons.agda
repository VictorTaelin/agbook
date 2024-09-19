module Base.List.zip-cons where

open import Base.List.Type
open import Base.List.map

-- Helper function to implement zip-cons.
-- - xs: The list to be zipped with.
-- - yss: The list of lists to zip with xs.
-- = A new list of lists where each element of xs is prepended to the corresponding list in yss.
zip-cons : ∀ {A : Set} → List A → List (List A) → List (List A)
zip-cons []        ys        = ys
zip-cons xs        []        = map (λ y → y :: []) xs
zip-cons (x :: xs) (y :: ys) = (x :: y) :: zip-cons xs ys
