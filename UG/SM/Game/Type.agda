module UG.SM.Game.Type where

record Game (S A : Set) : Set where
  field
    init : S
    when : A -> S -> S
    tick : S -> S
