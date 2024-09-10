module Imp.Test.Basic where

open import Data.U64.Type
open import Imp.Type
open import Imp.Notation

private
  from-nat = primWord64FromNat

example : Stmt
example = do
  0 :l= from-nat 0

  while (↑ 0) < (from-nat 10) go do
    0 :l= ↑ 0 + (from-nat 1)

  return ↑ 0
