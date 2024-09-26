module Base.Unit.Unit where

record Unit : Set where
  constructor unit

{-# BUILTIN UNIT Unit #-}
{-# COMPILE GHC Unit = data () (()) #-}
{-# COMPILE JS Unit = "(() => {})" #-}
