module Bend.Parser.first-with-guard where

open import Base.Bool.Type
open import Base.Bool.if
open import Base.List.Type
open import Base.Pair.Type
open import Base.Parser.Type
open import Base.Parser.Monad.bind

first-with-guard : ∀ {A : Set} -> List (Pair (Parser Bool) (Parser A)) -> Parser A -> Parser A
first-with-guard ((guard , p) :: ps) dflt = do
  is-guard <- guard
  if is-guard
    then p
    else first-with-guard ps dflt
first-with-guard [] dflt = dflt
