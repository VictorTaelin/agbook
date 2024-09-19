module Base.Bool.Type where

-- Represents a Boolean value.
-- - True: Represents logical truth.
-- - False: Represents logical falsehood.
data Bool : Set where
  True  : Bool
  False : Bool
{-# BUILTIN BOOL  Bool  #-}
{-# BUILTIN TRUE  True  #-}
{-# BUILTIN FALSE False #-}
