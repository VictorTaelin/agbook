module HVM2.Rule.link where

import HVM2.Run.link
open import Base.String.String
open import Base.Unit.Unit
open import HVM2.Run.Run
open import HVM2.Term.Term

-- Link interaction
link : String -> Term -> Run Unit
link x b = HVM2.Run.link.link (Var x) b
