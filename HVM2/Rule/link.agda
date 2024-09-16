module HVM2.Rule.link where

import HVM2.Run.link
open import Data.Bits.Type
open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Term.Type

-- Link interaction
link : Bits → Term → Run Unit
link x b = HVM2.Run.link.link (Var x) b
