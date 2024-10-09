module Base.Maybe.Maybe where

-- Represents an optional value.
-- - None: Represents the absence of a value.
-- - Some: Represents the presence of a value.
data Maybe {a} (A : Set a) : Set a where
  None : Maybe A
  Some : A → Maybe A
{-# BUILTIN MAYBE Maybe #-}

