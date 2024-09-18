module Base.List.intercalate where

open import Base.List.Type
open import Base.List.append

-- Intercalates a list between all lists in a list of lists.
-- - xs: The list to be inserted between other lists.
-- - yss: The list of lists to intercalate xs into.
-- = A new list with xs inserted between all lists in yss.
intercalate : ∀ {A : Set} → List A → List (List A) → List A
intercalate xs []          = []
intercalate xs (ys :: [])  = ys
intercalate xs (ys :: yss) = ys ++ xs ++ intercalate xs yss
