module Base.Bits.Decode-utf8.decode-utf8-go where

import Base.Char.from-nat as C
open import Base.Bits.Bits
open import Base.Bits.append
open import Base.Bits.reverse
open import Base.Bits.to-char
open import Base.Char.Char
open import Base.List.List

-- The Unicode replacement character (U+FFFD) used for invalid sequences.
utf8-replacement-character : Char
utf8-replacement-character = C.from-nat 0xfffd

-- function to process the list of 8-bit chunks.
-- bits: List of 8-bit chunks to process.
-- = List of decoded characters.
decode-utf8-go : List Bits → List Char
decode-utf8-go bits with bits
-- End of string
... | [] = []

-- 1-byte character (0xxxxxxx)
... | (O bits1) :: rest
  = to-char (reverse bits1) :: decode-utf8-go rest

-- 2-byte character (110xxxxx 10xxxxxx)
... | (I (I (O bits1))) :: (I (O (bits2))) :: rest
  = to-char (reverse (bits1 ++ bits2)) :: decode-utf8-go rest

-- 3-byte character (1110xxxx 10xxxxxx 10xxxxxx)
... | (I (I (I (O bits1)))) :: (I (O (bits2))) :: (I (O bits3)) :: rest
  = to-char (reverse (bits1 ++ bits2 ++ bits3)) :: decode-utf8-go rest

-- 4-byte character (11110xxx 10xxxxxx 10xxxxxx 10xxxxxx)
... | (I (I (I (I (O bits1))))) :: (I (O bits2)) :: (I (O bits3)) :: (I (O bits4)) :: rest
  = to-char (reverse (bits1 ++ bits2 ++ bits3 ++ bits4)) :: decode-utf8-go rest

-- Invalid sequence: replace with the replacement character
... | _ :: rest = utf8-replacement-character :: decode-utf8-go rest

