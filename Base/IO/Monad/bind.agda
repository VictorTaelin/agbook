module Base.IO.Monad.bind where

open import Base.IO.Type

postulate bind : ∀ {A B : Set} -> IO A -> (A -> IO B) -> IO B

-- Sequential composition of IO actions
-- - m1: The first IO action to be performed
-- - m2: The second IO action to be performed
-- = An IO action that performs m1 and then m2, discarding the result of m1
seq : {A B : Set} -> IO A -> IO B -> IO B
seq p q = bind p (λ _ -> q) 

-- Infix operator
_>>=_ : ∀ {A B : Set} -> IO A -> (A -> IO B) -> IO B
_>>=_ = bind

_>>_ : {A B : Set} -> IO A -> IO B -> IO B
_>>_ = seq

infixl 1 _>>=_ _>>_

{-# COMPILE GHC bind = \_ _ -> (>>=) #-}

{-# COMPILE JS _>>=_ = function(ma) { return function(f) { return function() { return ma().then(function(a) { return f(a)(); }); }; }; } #-}

