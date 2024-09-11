module Data.IO.seq where

open import Data.IO.Type
open import Data.IO.bind

-- Sequential composition of IO actions
-- - m1: The first IO action to be performed
-- - m2: The second IO action to be performed
-- = An IO action that performs m1 and then m2, discarding the result of m1
_>>_ : {A B : Set} → IO A → IO B → IO B
m1 >> m2 = m1 >>= λ _ → m2

infixl 1 _>>_

{-# COMPILE JS _>>_ = function(ma) { return function(mb) { return function() { ma(); return mb(); }; }; } #-}