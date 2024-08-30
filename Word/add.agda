module Word.add where

open import Nat.add
open import Word.Main

addWord : Word64 → Word64 → Word64
addWord a b = primWord64FromNat (primWord64ToNat a + primWord64ToNat b)

