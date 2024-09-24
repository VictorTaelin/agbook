module Base.String.lt where

open import Base.String.Type
open import Base.String.to-list
open import Base.Bool.Type
open import Base.Char.Type
import Base.List.lt as List
import Base.Char.Trait.Ord as CharOrd

lt : String -> String -> Bool
lt s1 s2 = List.lt {{CharOrd.OrdChar}} (to-list s1) (to-list s2)

infix 4 _<_
_<_ : String -> String -> Bool
_<_ = lt
