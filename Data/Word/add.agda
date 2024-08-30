module Data.Word.add where

open import Data.Nat.add
open import Data.Word.Main

addWord : Word64 → Word64 → Word64
addWord a b = primWord64FromNat (primWord64ToNat a + primWord64ToNat b)
