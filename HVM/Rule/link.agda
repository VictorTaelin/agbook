module HVM.Rule.link where

import HVM.Run.link as RunLink
open import Base.Bool.if
open import Base.String.String
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Addr.Addr
open import HVM.Mode.is-wired
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Term.Term

-- Link interaction
link : ∀ {mode : Mode} → (if is-wired mode then Addr else String) → Term mode → Run mode Unit
link x b = RunLink.link (Var x) b
