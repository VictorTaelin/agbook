module Data.IOAsync.bind where

open import Data.IOAsync.Type

postulate
  bind : ∀ {A B : Set} → IOAsync A → (A → IOAsync B) → IOAsync B

infixl 1 _>>=_

_>>=_ : ∀ {A B : Set} → IOAsync A → (A → IOAsync B) → IOAsync B
_>>=_ = bind

{-# COMPILE GHC bind = \_ _ -> (>>=) #-}
{-# COMPILE JS _>>=_ = function(ma) { return function(f) { return function() { return ma().then(function(a) { return f(a)(); }); }; }; } #-}


