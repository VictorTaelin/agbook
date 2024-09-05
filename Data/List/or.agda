module Data.List.or where

open import Data.List.Type
open import Data.List.foldr
open import Data.Bool.Type
import Data.Bool.or as B

-- Performs the boolean "or" operation between all elements of a list, in order.
or : List Bool → Bool
or = foldr B._||_ False
