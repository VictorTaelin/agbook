module Data.Bits.lt where

open import Data.Bits.Type
open import Data.Bool.Type
open import Data.Bits.reverse
open import Data.Bits.pad-length
open import Data.Pair.Type

lt-helper : Bits → Bits → Bool
lt-helper E E = False
lt-helper E (O _) = True
lt-helper E (I _) = True
lt-helper (O _) E = False
lt-helper (I _) E = False
lt-helper (O a') (O b') = lt-helper a' b'
lt-helper (O a') (I b') = True
lt-helper (I a') (O b') = False
lt-helper (I a') (I b') = lt-helper a' b'

-- Performs less than comparison on two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = True if a is less than b, False otherwise.
lt : Bits → Bits → Bool
lt a b = 
  let
    (padded-a , padded-b) = pad-length a b
    reversed-a = reverse padded-a
    reversed-b = reverse padded-b
  in
  lt-helper reversed-a reversed-b

-- Infix operator for bitwise less than comparison
_<_ : Bits → Bits → Bool
_<_ = lt

infix 4 _<_
