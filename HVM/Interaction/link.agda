module HVM.Interaction.link where

import HVM.Runtime.link
open import Data.Bits.Type
open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Term.Type

-- Link interaction
link : Bits → Term → Runtime Unit
link x b = HVM.Runtime.link.link (Var x) b
