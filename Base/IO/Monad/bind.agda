module Base.IO.Monad.bind where

open import Base.IO.IO

-- Bind operation for IO
-- - 1st: The IO action to be performed
-- - 2nd: A function that takes the result of ma and returns a new IO action
-- = An IO action that performs ma, then applies f to its result and performs the resulting IO action
postulate bind : ∀ {A B : Set} → IO A → (A → IO B) → IO B

-- Sequential composition of IO actions.
-- 1st: The first IO action to be performed.
-- 2nd: The second IO action to be performed.
-- = An IO action that performs m1 and then m2, discarding the result of m1.
seq : {A B : Set} → IO A → IO B → IO B
seq p q = bind p (λ _ → q) 

-- Infix operator
_>>=_ : ∀ {A B : Set} → IO A → (A → IO B) → IO B
_>>=_ = bind

_>>_ : {A B : Set} → IO A → IO B → IO B
_>>_ = seq

infixl 1 _>>=_ _>>_

{-# COMPILE GHC bind = \_ _ → (>>=) #-}
