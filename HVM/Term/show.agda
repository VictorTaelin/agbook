module HVM.Term.show where

import Data.Bits.show as Bits
open import Data.String.Type
open import Data.String.append
open import HVM.Term.Type

-- Converts a Term to its string representation.
-- - term: The Term to convert.
-- = A string representation of the Term.
show : Term → String
show (Var nm)   = Bits.show nm
show Era        = "*"
show (Con p1 p2) = "(" ++ show p1 ++ " " ++ show p2 ++ ")"
show (Dup p1 p2) = "{" ++ show p1 ++ " " ++ show p2 ++ "}"
