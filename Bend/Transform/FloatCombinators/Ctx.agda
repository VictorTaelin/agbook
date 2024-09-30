module Bend.Transform.FloatCombinators.Ctx where

open import Base.BitMap.BitMap
open import Base.BitMap.empty
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

record Ctx : Set where
  constructor MkCtx
  field
    book        : Book
    combinators : BitMap (Pair Bool FnDef)
    def         : FnDef
    name-gen    : Nat
    max-size    : Nat
    def-size    : Nat

init-ctx : Book -> FnDef -> Nat -> BitMap (Pair Bool FnDef) -> Ctx
init-ctx book def max-size combs = MkCtx book combs def 0 max-size 0
