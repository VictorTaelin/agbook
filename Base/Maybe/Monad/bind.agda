module Base.Maybe.Monad.bind where

open import Base.Maybe.Maybe

-- Applies a function to the value inside a Maybe, if it exists.
-- - ma: The Maybe value to operate on.
-- - fn: The function to apply to the value inside the Maybe.
-- = A new Maybe value resulting from applying f to the contents of ma.
bind : ∀ {A B : Set} → Maybe A → (A → Maybe B) → Maybe B
bind None     fn = None
bind (Some x) fn = fn x

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → Maybe A → (A → Maybe B) → Maybe B
_>>=_ = bind

infixl 1 _>>=_
