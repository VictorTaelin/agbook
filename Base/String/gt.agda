module Base.String.gt where

open import Base.String.Type
open import Base.String.to-list
open import Base.Bool.Type
open import Base.Char.Type
import Base.List.gt as List
import Base.Char.Trait.Ord as CharOrd

gt : String -> String -> Bool
gt s1 s2 = List.gt {{CharOrd.OrdChar}} (to-list s1) (to-list s2)

infix 4 _>_
_>_ : String -> String -> Bool
_>_ = gt
