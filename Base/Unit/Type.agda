module Base.Unit.Type where

record Unit : Set where
  constructor unit

{-# BUILTIN UNIT Unit #-}
{-# COMPILE GHC Unit = data () (()) #-}
{-# COMPILE JS Unit = "(() => {})" #-}
