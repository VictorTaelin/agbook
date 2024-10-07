module Bend.Fun.Term.add-num where

open import Base.Nat.Nat
open import Base.Nat.add
open import Bend.Fun.Term.Term renaming (Num to Num')
open import Bend.Fun.Op.Op
open import Bend.Fun.Num.Num

add-num : Term → Nat → Term
add-num term 0 = term
add-num term n = Oper Add term (Num' (U24 n))
