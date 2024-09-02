module Data.IO.put-str-ln where

open import Data.IO.Type
open import Data.Unit.Type
open import Data.String.Type

postulate
  put-str-ln : String → IO Unit

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}

{-# COMPILE GHC put-str-ln = Text.putStrLn #-}
{-# COMPILE JS put-str-ln = function(x) { return function() { console.log(x); }; } #-}
