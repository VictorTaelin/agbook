module Data.Bits.encode-char-utf8 where

open import Data.Char.Type
open import Data.Char.to-nat
open import Data.Nat.Type
open import Data.Bits.Type
open import Data.Bits.from-nat
open import Data.Bits.and
open import Data.Bits.lte
open import Data.Bits.rshift
open import Data.Bits.add
open import Data.Bits.pad-zeros
open import Data.List.Type
open import Data.List.singleton
open import Data.Bool.Type

-- Encodes a Char (a Unicode codepoint) to its possibly multi-byte UTF-8 representation.
-- Note that least significant bits come LAST, so you'll probably need to reverse the resulting list.
-- - c: The input Char to encode.
-- = A List of Bits representing the UTF-8 encoding of the input Char.
encode-char-utf8 : Char → List Bits
encode-char-utf8 c = go (from-nat (to-nat c)) where
  go : Bits → List Bits
  go oc with oc <= (from-nat 0x7f)
  ... | True = [ pad-zeros 8 oc ]
  ... | False with oc <= (from-nat 0x7ff)
  ...   | True = pad-zeros 8 ((from-nat 0xc0) + (oc >> 6)) ::
                 pad-zeros 8 ((from-nat 0x80) + (oc && (from-nat 0x3f))) :: []
  ...   | False with oc <= (from-nat 0xffff)
  ...     | True = pad-zeros 8 ((from-nat 0xe0) + (oc >> 12)) ::
                   pad-zeros 8 ((from-nat 0x80) + ((oc >> 6) && (from-nat 0x3f))) ::
                   pad-zeros 8 ((from-nat 0x80) + (oc && (from-nat 0x3f))) :: []
  ...     | False = pad-zeros 8 ((from-nat 0xf0) + (oc >> 18)) ::
                    pad-zeros 8 ((from-nat 0x80) + ((oc >> 12) && (from-nat 0x3f))) ::
                    pad-zeros 8 ((from-nat 0x80) + ((oc >> 6) && (from-nat 0x3f))) ::
                    pad-zeros 8 ((from-nat 0x80) + (oc && (from-nat 0x3f))) :: []
