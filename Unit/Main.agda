module Unit.Main where

record Unit : Set where
  constructor unit

{-# BUILTIN UNIT Unit #-}
{-# COMPILE GHC Unit = data () (()) #-}
