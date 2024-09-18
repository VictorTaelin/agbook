module Data.Bit.Type where

-- Represents a Boolean value.
-- - True: Represents logical truth.
-- - False: Represents logical falsehood.
data Bit : Set where
  True  : Bit
  False : Bit
{-# BUILTIN BOOL  Bit  #-}
{-# BUILTIN TRUE  True  #-}
{-# BUILTIN FALSE False #-}
