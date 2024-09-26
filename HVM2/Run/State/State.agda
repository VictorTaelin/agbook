module HVM2.Run.State.State where

open import HVM2.Net.Net
open import HVM2.Term.Term
open import Base.Nat.Nat
open import Base.OrdMap.OrdMap
open import Base.String.String

-- HVM2's global state
record State : Set where
  constructor MkState
  field
    gnet : Net
    subs : OrdMap String Term
    vars : Nat
