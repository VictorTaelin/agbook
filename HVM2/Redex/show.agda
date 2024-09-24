module HVM2.Redex.show where

import HVM2.Term.show as Term
open import Base.String.Type
open import Base.String.append
open import HVM2.Redex.Type

-- Converts a Redex to its string representation.
-- - redex: The Redex to convert.
-- = A string representation of the Redex.
show : Redex -> String
show redex = Term.show (Redex.lft redex) ++ " ~ " ++ Term.show (Redex.rgt redex)
