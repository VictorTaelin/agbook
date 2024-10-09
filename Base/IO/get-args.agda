module Base.IO.get-args where

open import Base.IO.IO
open import Base.List.List
open import Base.String.String
open import Base.List.map

-- Retrieves the command-line arguments passed to the program.
-- = Returns an IO action that, when executed, will return
--   a List of Strings representing the command-line arguments.
postulate get-args : IO (List String)

{-# FOREIGN GHC import System.Environment #-}
{-# FOREIGN GHC import qualified Data.Text as Text #-}
{-# COMPILE GHC get-args = fmap (map Text.pack) getArgs #-}

{-# COMPILE JS get-args = function() { return Promise.resolve(process.argv.slice(2)); } #-}

