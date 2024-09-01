module Data.IO.get-line where

open import Data.IO.Type
open import Data.String.Type

postulate
  get-line : IO String

{-# COMPILE GHC get-line = getLine #-}
{-# COMPILE JS get-line = function() { return prompt(); } #-}
