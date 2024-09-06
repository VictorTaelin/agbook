module Data.List.and where

open import Data.List.Type
open import Data.List.foldr
open import Data.Bool.Type
import Data.Bool.and as B

-- Performs the boolean "and" operation between all elements of a list.
-- - xs: The input list of boolean values.
-- = True if all elements are True, False otherwise.
and : List Bool → Bool
and = foldr B._&&_ True
