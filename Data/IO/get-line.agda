module Data.IO.get-line where

open import Data.IO.Type
open import Data.String.Type

postulate
  get-line : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}

{-# COMPILE GHC get-line = Text.getLine #-}
{-# COMPILE JS get-line = function() { return prompt(); } #-}
