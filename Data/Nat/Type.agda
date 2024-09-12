module Data.Nat.Type where

open import Data.String.Type

data Nat : Set where
  Zero : Nat
  Succ : Nat → Nat

{-# BUILTIN NATURAL Nat #-}

primitive
  primShowNat : Nat → String
