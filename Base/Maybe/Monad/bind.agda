module Base.Maybe.Monad.bind where

open import Base.Maybe.Maybe
open import Base.Function.const

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

-- Sequencing operator that ignores the value of the first Maybe.
-- - ma: The first Maybe value (ignored).
-- - mb: The second Maybe value.
-- = Returns mb if ma is Some, otherwise None.
_>>_ : ∀ {A B : Set} → Maybe A → Maybe B → Maybe B
_>>_ ma mb = ma >>= const mb

infixl 1 _>>_

