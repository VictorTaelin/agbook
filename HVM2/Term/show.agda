module HVM2.Term.show where

open import Base.String.Type
open import Base.String.append
open import HVM2.Term.Type

-- Converts a Term to its string representation.
-- - term: The Term to convert.
-- = A string representation of the Term.
show : Term -> String
show (Var nm)    = nm
show Era         = "*"
show (Con p1 p2) = "(" ++ show p1 ++ " " ++ show p2 ++ ")"
show (Dup p1 p2) = "{" ++ show p1 ++ " " ++ show p2 ++ "}"
