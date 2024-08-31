module Data.Char.Type where

open import Data.Bool.Type
open import Data.Nat.Type
-- open import Data.String.Type

postulate Char : Set
{-# BUILTIN CHAR Char #-}

primitive
  primIsLower    : Char → Bool
  primIsDigit    : Char → Bool
  primIsAlpha    : Char → Bool
  primIsSpace    : Char → Bool
  primIsAscii    : Char → Bool
  primIsLatin1   : Char → Bool
  primIsPrint    : Char → Bool
  primIsHexDigit : Char → Bool
  primToUpper    : Char → Char
  primToLower    : Char → Char
  primCharToNat  : Char → Nat
  primNatToChar  : Nat → Char
  --primShowChar   : Char → String
