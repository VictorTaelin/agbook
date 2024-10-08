module Base.List.for-given where

open import Base.List.List
open import Base.Trait.Monad
open import Base.Function.case

-- Applies a monadic function to each element of a list, threading a state through the computation.
-- - xs: The list of elements to process.
-- - s: The initial state.
-- - f: The monadic function that takes the current state and list element, and returns a new state.
-- = A monadic value containing the final state after processing all elements.
for-given
  : ∀ {M : Set → Set} {{monadM : Monad M}} {A S : Set}
    → List A → S → (S → A → M S) → M S
for-given []        s f = pure s
for-given (x :: xs) s f = do s ← f s x ; for-given xs s f

-- Custom syntax for 'for-given'
for_given_
  : ∀ {M : Set → Set} {{monadM : Monad M}} {A S : Set}
    → List A → S → (S → A → M S) → M S
for_given_ = for-given

-- Infix operator for the custom syntax
infix 0 for_given_
