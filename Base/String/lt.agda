module Base.String.lt where

open import Base.String.Type
open import Base.String.to-list
open import Base.Bool.Type
open import Base.Char.Type
import Base.List.lt as List
open import Base.Char.Ord

lt : String → String → Bool
lt s1 s2 = List.lt {{OrdChar}} (to-list s1) (to-list s2)
