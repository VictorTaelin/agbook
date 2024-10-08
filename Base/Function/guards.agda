module Base.Function.guards where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Pair.Pair
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Function.case

-- Implements a guarded expression evaluation.
-- - A: The type of the result.
-- - xs: A list of pairs, each containing a boolean condition and a value.
-- - def: The default value to return if no condition is met.
-- = The value associated with the first true condition, or the default value.
guards : ∀ {A : Set} → List (Pair Bool A) → A → A
guards []                  def = def
guards ((True  , x) :: _)  def = x  
guards ((False , _) :: xs) def = guards xs def
