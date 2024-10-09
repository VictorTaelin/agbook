module Base.IO.get-line where

open import Base.IO.IO
open import Base.String.String

-- Reads a line of input from the console.
-- = An IO action that returns the input string.
postulate get-line : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# FOREIGN GHC import qualified Control.Exception   #-}

{-# COMPILE GHC get-line = Text.getLine #-}

