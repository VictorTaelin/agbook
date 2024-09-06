module Data.Bits.sub where

open import Data.Bits.Type
open import Data.Bits.pad-length
open import Data.Bits.gt
open import Data.Bits.strip
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.Pair.snd
open import Data.Bool.Type
open import Data.Bool.if

-- Helper function to perform subtraction with borrow
sub-with-borrow : Bits → Bits → Bool → Bits
sub-with-borrow E E _ = E
sub-with-borrow E (O b) False = O (sub-with-borrow E b False)
sub-with-borrow E (O b) True = I (sub-with-borrow E b False)
sub-with-borrow E (I b) False = I (sub-with-borrow E b False)
sub-with-borrow E (I b) True = O (sub-with-borrow E b True)
sub-with-borrow (O a) E _ = O a
sub-with-borrow (I a) E _ = I a
sub-with-borrow (O a) (O b) False = O (sub-with-borrow a b False)
sub-with-borrow (O a) (O b) True = I (sub-with-borrow a b True)
sub-with-borrow (O a) (I b) False = I (sub-with-borrow a b True)
sub-with-borrow (O a) (I b) True = O (sub-with-borrow a b True)
sub-with-borrow (I a) (O b) False = I (sub-with-borrow a b False)
sub-with-borrow (I a) (O b) True = O (sub-with-borrow a b False)
sub-with-borrow (I a) (I b) False = O (sub-with-borrow a b False)
sub-with-borrow (I a) (I b) True = I (sub-with-borrow a b True)

-- Performs subtraction of two Bits values for unsigned bit math.
-- - minuend: The first Bits value (minuend).
-- - subtrahend: The second Bits value (subtrahend).
-- = A Bits value representing the difference of minuend and subtrahend,
--   or E (0) if minuend is not greater than subtrahend.
sub : Bits → Bits → Bits
sub minuend subtrahend =
  let padded = pad-length minuend subtrahend
      m = fst padded
      s = snd padded
  in if gt m s
     then strip (sub-with-borrow m s False)
     else E

-- Infix operator for Bits subtraction
_-_ : Bits → Bits → Bits
_-_ = sub

infixl 6 _-_
