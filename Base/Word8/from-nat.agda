module Base.Word8.from-nat where

open import Base.Nat.Nat
open import Base.Word8.Word8

postulate from-nat : Nat -> Word8

{-# COMPILE GHC from-nat = fromIntegral #-}

