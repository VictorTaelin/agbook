module Base.List.or where

open import Base.List.Type
open import Base.List.foldr
open import Base.Bool.Type
import Base.Bool.or as B

-- Performs the boolean "or" operation between all elements of a list.
-- - xs: The input list of boolean values.
-- = True if any element is True, False otherwise.
or : List Bool → Bool
or = foldr B._||_ False
