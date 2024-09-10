module Data.Bits.gt where

open import Data.Bits.Type
open import Data.Bool.Type
open import Data.Bits.reverse
open import Data.Bits.pad-length
open import Data.Pair.Type

gt-helper : Bits → Bits → Bool
gt-helper E E = False
gt-helper E (O _) = False
gt-helper E (I _) = False
gt-helper (O _) E = True
gt-helper (I _) E = True
gt-helper (O a') (O b') = gt-helper a' b'
gt-helper (O a') (I b') = False
gt-helper (I a') (O b') = True
gt-helper (I a') (I b') = gt-helper a' b'

-- Performs greater than comparison on two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = True if a is greater than b, False otherwise.
gt : Bits → Bits → Bool
gt a b = 
  let
    (padded-a , padded-b) = pad-length a b
    reversed-a = reverse padded-a
    reversed-b = reverse padded-b
  in
  gt-helper reversed-a reversed-b

-- Infix operator for bitwise greater than comparison
_>_ : Bits → Bits → Bool
_>_ = gt

infix 4 _>_
