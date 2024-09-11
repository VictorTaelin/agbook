module Data.IOAsync.pure where

open import Data.IOAsync.Type

postulate
  pure : ∀ {A : Set} → A → IOAsync A

{-# COMPILE GHC pure = \_ -> return #-}
{-# COMPILE JS pure = function(x) { return function() { return Promise.resolve(x); }; } #-}

