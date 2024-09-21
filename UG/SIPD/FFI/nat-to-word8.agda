module UG.SIPD.FFI.nat-to-word8 where

open import Data.Nat.Type
open import UG.SIPD.FFI.Word8

postulate nat-to-word8 : Nat -> Word8

{-# COMPILE GHC nat-to-word8 = fromIntegral #-}

