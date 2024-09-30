module UG.SIPD.Event.Click.serialize where

open import UG.SIPD.Event.Click.Click
open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.pack-string
open import Base.Word8.Word8
open import Base.Word8.from-nat

-- Serializes a Click event into a ByteString.
-- The first byte represents the button type:
-- 0 for LeftButton, 1 for RightButton.
-- The rest of the ByteString is empty (represented by an empty string).
serialize : Click → ByteString
serialize LeftButton  = cons (from-nat 0) (pack-string "")
serialize RightButton = cons (from-nat 1) (pack-string "")
