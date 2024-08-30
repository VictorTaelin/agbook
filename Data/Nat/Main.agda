module Data.Nat.Main where

data Nat : Set where
  zero : Nat
  succ : Nat → Nat
{-# BUILTIN NATURAL Nat #-}
