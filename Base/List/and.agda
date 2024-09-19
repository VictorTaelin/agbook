module Base.List.and where

open import Base.List.Type
open import Base.List.foldr
open import Base.Bool.Type
import Base.Bool.and as B

-- Performs the boolean "and" operation between all elements of a list.
-- - xs: The input list of boolean values.
-- = True if all elements are True, False otherwise.
and : List Bool → Bool
and = foldr B._&&_ True
