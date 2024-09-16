module Data.IOAsync.seq where

open import Data.IOAsync.Type
open import Data.IOAsync.bind

_>>_ : {A B : Set} → IOAsync A → IOAsync B → IOAsync B
m1 >> m2 = m1 >>= λ _ → m2

infixl 1 _>>_

{-# COMPILE JS _>>_ = function(ma) { return function(mb) { return function() { return ma().then(function() { return mb(); }); }; }; } #-}


