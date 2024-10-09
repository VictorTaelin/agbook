module HVM.Term.show where

open import Base.String.String
open import Base.String.append
open import HVM.Term.Term
open import HVM.Addr.Addr

-- Converts a Term to its string representation.
-- - term: The Term to convert.
-- = A string representation of the Term.
show : Term → String
show (Var nm _) = nm
show Era         = "*"
show (Con p1 p2) = "(" ++ show p1 ++ " " ++ show p2 ++ ")"
show (Dup p1 p2) = "{" ++ show p1 ++ " " ++ show p2 ++ "}"

