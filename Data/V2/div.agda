module Data.V2.div where

open import Data.V2.Main
open import Data.Float.Operations

-- Divides one V2 vector by another.
-- - v1: The dividend V2 vector.
-- - v2: The divisor V2 vector.
-- = A new V2 vector representing the component-wise division of v1 by v2.
div_v2 : V2 → V2 → V2
div_v2 (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 f/ x2) (y1 f/ y2)
