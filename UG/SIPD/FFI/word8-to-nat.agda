module UG.SIPD.FFI.word8-to-nat where

open import Data.Nat.Type
open import UG.SIPD.FFI.Word8

postulate word8-to-nat : Word8 -> Nat

{-# COMPILE GHC word8-to-nat = fromIntegral #-}
