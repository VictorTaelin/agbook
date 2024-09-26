module Base.IO.Monad.pure where

open import Base.IO.IO

postulate pure : ∀ {A : Set} -> A -> IO A

{-# COMPILE GHC pure = \_ -> return #-}

{-# COMPILE JS pure = function(x) { return function() { return Promise.resolve(x); }; } #-}


