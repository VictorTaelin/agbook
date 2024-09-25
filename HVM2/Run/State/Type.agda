module HVM2.Run.State.Type where

open import HVM2.Net.Type
open import HVM2.Term.Type
open import Base.Nat.Type
open import Base.OrdMap.Type
open import Base.String.Type

-- HVM2's global state
record State : Set where
  constructor MkState
  field
    gnet : Net
    subs : OrdMap String Term
    vars : Nat
