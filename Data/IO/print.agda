module Data.IO.print where

open import Data.IO.Type
open import Data.Unit.Type
open import Data.String.Type

postulate
  print : String → IO Unit

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}

{-# COMPILE GHC print = Text.putStrLn #-}
{-# COMPILE JS print = function(str) { return function() { console.log(str); return {}; }; } #-}
