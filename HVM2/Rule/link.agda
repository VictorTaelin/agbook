module HVM2.Rule.link where

import HVM2.Run.link
open import Base.Bits.Type
open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Term.Type

-- Link interaction
link : Bits → Term → Run Unit
link x b = HVM2.Run.link.link (Var x) b
