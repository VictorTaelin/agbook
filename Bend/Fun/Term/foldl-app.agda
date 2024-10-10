module Bend.Fun.Term.foldl-app where

open import Base.List.List
open import Base.List.foldl
open import Bend.Fun.Term.Term renaming (List to List')

foldl-app : Term → List Term → Term
foldl-app fun arg = foldl App fun arg

