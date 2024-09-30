module Base.V2.V2 where

open import Base.F64.F64

-- Represents a 2D vector with float coordinates.
-- - 1st: The x-coordinate (F64).
-- - 2nd: The y-coordinate (F64).
-- = A record type V2 containing x and y fields.
record V2 : Set where
  constructor MkV2
  field
    x : F64
    y : F64

{-# FOREIGN GHC
import qualified Data.Vector as V

data V2 = MkV2 { x :: Double , y :: Double }
#-}

{-# COMPILE GHC V2 = data V2 (MkV2) #-}
