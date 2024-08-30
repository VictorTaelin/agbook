module Data.Maybe.Main where

data Maybe {a} (A : Set a) : Set a where
  none : Maybe A
  some : A → Maybe A
{-# BUILTIN MAYBE Maybe #-}
