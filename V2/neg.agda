module V2.neg where

open import V2.Main
open import Float.Main

-- Negates a V2 vector
-- - v: the V2 vector to negate
-- = a new V2 vector with negated coordinates
neg_v2 : V2 → V2
neg_v2 (MkV2 x y) = MkV2 (primFloatNegate x) (primFloatNegate y)
