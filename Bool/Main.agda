module Bool.Main where

-- Represents a Boolean value.
-- - true: represents logical truth.
-- - false: represents logical falsehood.
data Bool : Set where
  true  : Bool
  false : Bool
{-# BUILTIN BOOL  Bool  #-}
{-# BUILTIN TRUE  true  #-}
{-# BUILTIN FALSE false #-}
