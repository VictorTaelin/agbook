module Base.Maybe.Type where

-- A type representing an optional value.
-- - A: The type of the value that may or may not be present.
-- - None: Represents the absence of a value.
-- - Some: Represents the presence of a value.
data Maybe {a} (A : Set a) : Set a where
  None : Maybe A
  Some : (value : A) → Maybe A

{-# BUILTIN MAYBE Maybe #-}
