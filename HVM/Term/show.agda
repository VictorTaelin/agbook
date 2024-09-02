module HVM.Term.show where

open import Data.String.Type
open import Data.String.append
open import HVM.Term.Type
import Data.Bits.show as Bits

-- Converts a Term to its string representation.
-- - term: The Term to convert.
-- = A string representation of the Term.
show : Term → String
show (Var nam)     = Bits.show nam
show (App fun arg) = "(" ++ show fun ++ " " ++ show arg ++ ")"
show (Lam nam bod) = "λ" ++ Bits.show nam ++ "." ++ show bod
