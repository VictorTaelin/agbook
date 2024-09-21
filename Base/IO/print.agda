module Base.IO.print where

open import Base.IO.Type
open import Base.String.Type
open import Base.Unit.Type

postulate print : String → IO Unit

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# COMPILE GHC print = Text.putStrLn #-}
{-# COMPILE JS print = function(s) { return function() { return Promise.resolve(console.log(s)); }; } #-}
