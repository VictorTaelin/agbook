module HVM.Run.State.State where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.OrdMap.OrdMap
open import Base.String.String
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Mode.is-wired
open import HVM.Net.Net
open import HVM.Term.Term

record State (mode : Mode) : Set where
  constructor MkState
  field
    gnet : Net mode
    subs : if is-wired mode then Unit else OrdMap String (Term mode)
    vars : if is-wired mode then Unit else Nat
