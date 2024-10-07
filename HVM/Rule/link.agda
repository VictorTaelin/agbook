module HVM.Rule.link where

import HVM.Run.link as RunLink
open import Base.String.String
open import Base.Unit.Unit
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Term.Term

-- Link interaction
link : String → Term → Run Unit
link x b = RunLink.link (Var x) b
