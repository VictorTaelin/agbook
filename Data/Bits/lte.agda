module Data.Bits.lte where

open import Data.Bits.Type
open import Data.Bool.Type
open import Data.Bits.reverse
open import Data.Bits.pad-length
open import Data.Pair.Type

lte-helper : Bits → Bits → Bool
lte-helper E E = True
lte-helper E (O _) = True
lte-helper E (I _) = True
lte-helper (O _) E = False
lte-helper (I _) E = False
lte-helper (O a') (O b') = lte-helper a' b'
lte-helper (O a') (I b') = True
lte-helper (I a') (O b') = False
lte-helper (I a') (I b') = lte-helper a' b'

-- Performs less than comparison on two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = True if a is less than b, False otherwise.
lte : Bits → Bits → Bool
lte a b = 
  let
    (padded-a , padded-b) = pad-length a b
    reversed-a = reverse padded-a
    reversed-b = reverse padded-b
  in
  lte-helper reversed-a reversed-b

-- Infix operator for bitwise less than comparison
_<=_ : Bits → Bits → Bool
_<=_ = lte

infix 4 _<=_
