module Base.IO.Monad.pure where

open import Base.IO.IO

-- Lifts a pure value into the IO monad.
-- 1st: The value to lift.
-- = An IO action that returns the given value.
postulate pure : ∀ {A : Set} → A → IO A

{-# COMPILE GHC pure = \_ -> return #-}

