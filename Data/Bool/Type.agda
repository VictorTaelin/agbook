module Data.Bool.Type where

-- Represents a Boolean value.
-- - true: Represents logical truth.
-- - false: Represents logical falsehood.
data Bool : Set where
  true  : Bool
  false : Bool
{-# BUILTIN BOOL  Bool  #-}
{-# BUILTIN TRUE  true  #-}
{-# BUILTIN FALSE false #-}
