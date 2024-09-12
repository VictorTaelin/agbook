module Data.IOAsync.Type where

postulate IOAsync : Set → Set

{-# BUILTIN IO IOAsync #-}
{-# COMPILE GHC IOAsync = type IO #-}


