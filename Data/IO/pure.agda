module Data.IO.pure where

open import Data.IO.Type

postulate
  pure : ∀ {A : Set} → A → IO A

{-# COMPILE GHC pure = \_ -> return #-}
{-# COMPILE JS pure = function(x) { return function() { return x; }; } #-}
