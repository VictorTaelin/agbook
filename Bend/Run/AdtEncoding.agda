module Bend.Run.AdtEncoding where

-- The lambda encoding of ADTs.
data AdtEncoding : Set where

  -- Scott encoding
  -- λa1 .. λan λx1 .. λxm (xi a1 .. an)
  Scott    : AdtEncoding

  -- Scott encoding, but using a number to indicate the variant 
  -- λa1 .. λan λx (x i a1 .. an)
  NumScott : AdtEncoding
