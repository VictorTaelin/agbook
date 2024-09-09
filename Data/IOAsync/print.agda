module Data.IOAsync.print where

open import Data.IOAsync.Type
open import Data.String.Type
open import Data.Unit.Type

postulate print : String → IOAsync Unit

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# COMPILE GHC print = Text.putStrLn #-}

{-# COMPILE JS print = function(s) { return function() { return Promise.resolve(console.log(s)); }; } #-}

