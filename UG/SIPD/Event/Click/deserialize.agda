module UG.SIPD.Event.Click.deserialize where

open import Base.ByteString.ByteString
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Word8.Word8
open import Base.Word8.to-nat
open import UG.SIPD.Event.Click.Click

-- Deserializes a Word8 into a Click event.
-- - w: The Word8 to deserialize.
-- = Some Click if the input is valid (0 for LeftButton, 1 for RightButton),
--   or None if the input is invalid.
deserialize : Word8 → Maybe Click
deserialize w with (to-nat w)
... | 0 = Some LeftButton
... | 1 = Some RightButton
... | _ = None

