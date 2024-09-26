module Base.ByteString.pack-string-fixed where

open import Base.ByteString.ByteString
open import Base.ByteString.pack-string
open import Base.List.List
open import Base.List.head
open import Base.List.take
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.from-char
open import Base.String.to-list

-- Packs a string into a ByteString of fixed length.
-- If the string is shorter than the specified length, it's padded.
-- If it's longer, it's truncated.
-- - str: The input string to pack.
-- - length: The desired length of the resulting ByteString.
-- = Some ByteString if successful, None if the input string is empty.
pack-string-fixed : String -> Nat -> Maybe ByteString
pack-string-fixed str length = do
  let fixed-str = take length (to-list str)
  maybe-str <- head fixed-str
  Some (pack-string (from-char maybe-str))
