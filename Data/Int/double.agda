module Data.Int.double where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Int.inc
open import Data.Int.dec


double : Int → Int
double (Pos Zero)         = (Pos Zero)
double (Pos (Succ n))     = inc (inc (double (Pos n))) 
double (NegSuc Zero)      = (Pos Zero)
double (NegSuc (Succ n))  = dec (dec (double (NegSuc n)))
