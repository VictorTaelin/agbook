module HVM.Redex.show where

import HVM.Term.show as Term
open import Base.String.String
open import Base.String.append
open import HVM.Redex.Redex

-- Converts a Redex to its string representation.
-- - redex: The Redex to convert.
-- = A string representation of the Redex.
show : Redex → String
show redex = Term.show (Redex.lft redex) ++ " ~ " ++ Term.show (Redex.rgt redex)
