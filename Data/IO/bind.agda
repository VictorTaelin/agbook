module Data.IO.bind where

open import Data.IO.Type

postulate
  bind : ∀ {A B : Set} → IO A → (A → IO B) → IO B

infixl 1 _>>=_

_>>=_ : ∀ {A B : Set} → IO A → (A → IO B) → IO B
_>>=_ = bind

{-# COMPILE GHC bind = \_ _ -> (>>=) #-}
{-# COMPILE JS bind = function(x) { return function(f) { return x().then(f); }; } #-}
