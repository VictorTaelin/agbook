module Data.Int.double where

open import Data.Int.Type
open import Data.Int.inc
open import Data.Int.dec
open import Data.Nat.Type


double : Int → Int
double (Pos (Succ n))     = (inc (inc (double (Pos n))))
double (NegSuc (Succ n))  = (dec (dec (double (NegSuc n))))
double n                  = n
