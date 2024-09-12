module Data.Bits.encode-char-utf8 where

open import Data.Char.Type
open import Data.Bits.Type
open import Data.Bits.from-char
open import Data.Bits.append
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.split-at
open import Data.Bits.pad-zeros
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.lte
open import Data.Pair.Type

-- Encodes a character into its UTF-8 representation as Bits.
-- - c: The character to encode.
-- = A Bits value representing the UTF-8 encoding of the character.
encode-char-utf8 : Char → Bits
encode-char-utf8 c = do
  let bits = from-char c -- should be exactly 21 bits
  let n = to-nat bits
  if n <= 0x7F
    then (do
      -- 1-byte character (0xxxxxxx)
      let (bits₁ , rest₁) = split-at 7 bits
      bits₁ ++ (O E))
    else if n <= 0x7FF
      then (do
        -- 2-byte character (110xxxxx 10xxxxxx)
        let (bits₁ , rest₁) = split-at 6 bits
        let (bits₂ , rest₂) = split-at 5 rest₁
        bits₁ ++ O (I E) ++ bits₂ ++ O (I (I E)))
      else if n <= 0xFFFF
        then (do
          -- 3-byte character (1110xxxx 10xxxxxx 10xxxxxx)
          let (bits₁ , rest₁) = split-at 6 bits
          let (bits₂ , rest₂) = split-at 6 rest₁
          let (bits₃ , rest₃) = split-at 4 rest₂
          bits₁ ++ O (I E) ++ bits₂ ++ O (I E) ++ bits₃ ++ O (I (I (I E))))
        else if n <= 0x10FFFF
          then (do
            -- 4-byte character (11110xxx 10xxxxxx 10xxxxxx 10xxxxxx)
            let (bits₁ , rest₁) = split-at 6 bits
            let (bits₂ , rest₂) = split-at 6 rest₁
            let (bits₃ , rest₃) = split-at 6 rest₂
            let (bits₄ , rest₄) = split-at 3 rest₃
            bits₁ ++ O (I E) ++ bits₂ ++ O (I E) ++ bits₃ ++ O (I E) ++ bits₄ ++ O (I (I (I (I E)))))
          else (do
            -- Invalid char - shouldn't happen, we'll put a \0
            pad-zeros 8 E)
