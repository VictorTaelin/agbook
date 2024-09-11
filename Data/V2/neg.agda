module Data.V2.neg where

open import Data.V2.Type
open import Data.Float.Type
open import Data.Float.negate

-- Negates a V2 vector.
-- - v: The V2 vector to negate.
-- = A new V2 vector with negated coordinates.
neg_v2 : V2 → V2
neg_v2 (MkV2 x y) = MkV2 (negate x) (negate y)
