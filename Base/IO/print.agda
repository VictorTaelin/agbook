module Base.IO.print where

open import Base.IO.IO
open import Base.String.String
open import Base.Unit.Unit

-- Prints a string to the console.
-- 1st: The string to print.
-- = IO action that prints the string.
postulate print : String -> IO Unit

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# COMPILE GHC print = Text.putStrLn #-}