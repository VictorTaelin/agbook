module Base.Word8.to-nat where

open import Base.Nat.Nat
open import Base.Word8.Word8

postulate to-nat : Word8 -> Nat

{-# COMPILE GHC to-nat = fromIntegral #-}
