module Data.Float.and where

open import Data.Float.Type
open import Data.Float.to-bits
open import Data.Float.from-bits
open import Data.U64.Type
open import Data.U64.and
open import Data.Maybe.Type

-- auxiliar function to handle maybe values
maybe : ∀ {a b} {A : Set a} {B : Set b} → B → (A → B) → Maybe A → B
maybe d f None = d
maybe d f (Some x) = f x

-- Performs bitwise AND on two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The result of bitwise AND on x and y.
float-and : Float → Float → Float
float-and x y = 
    maybe 0.0 (\x' → 
        maybe 0.0 (\y' →
            maybe 0.0 (\z → z) (from-bits (and x' y'))
        ) (to-bits y)
    ) (to-bits x)

infixr 6 _&_
_&_ : Float → Float → Float
_&_ = float-and