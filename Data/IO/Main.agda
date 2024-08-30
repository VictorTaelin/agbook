module Data.IO.Main where

open import Data.Unit.Main
open import Data.String.Main

postulate IO : Set → Set
{-# BUILTIN IO IO #-}
{-# COMPILE GHC IO = type IO #-}

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}

postulate
  putStrLn : String → IO Unit
  getLine  : IO String

{-# COMPILE GHC putStrLn = Text.putStrLn #-}
{-# COMPILE GHC getLine  = Text.getLine #-}

{-# COMPILE JS IO = function(x) { return x; } #-}
{-# COMPILE JS putStrLn = function(x) { return function() { console.log(x); }; } #-}
{-# COMPILE JS getLine = function() { return prompt(); } #-}
