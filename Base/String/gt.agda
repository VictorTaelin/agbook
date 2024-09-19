module Base.String.gt where

open import Base.String.Type
open import Base.String.to-list
open import Base.Bool.Type
open import Base.Char.Type
import Base.List.gt as List
open import Base.Char.Ord

gt : String → String → Bool
gt s1 s2 = List.gt {{OrdChar}} (to-list s1) (to-list s2)
