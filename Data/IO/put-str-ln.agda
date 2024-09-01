module Data.IO.put-str-ln where

open import Data.IO.Type
open import Data.Unit.Type
open import Data.String.Type

postulate
  put-str-ln : String → IO Unit

{-# COMPILE GHC put-str-ln = putStrLn #-}
{-# COMPILE JS put-str-ln = function(x) { return function() { console.log(x); }; } #-}
