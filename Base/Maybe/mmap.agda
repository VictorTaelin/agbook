module Base.Maybe.mmap where

open import Base.Maybe.Maybe
open import Base.Trait.Monad

-- Applies a monadic function to a Maybe value.
-- - F: The monad to operate in.
-- - f: The monadic function to apply.
-- - ma: The Maybe value to operate on.
-- = A new monadic Maybe value resulting from applying f to the contents of ma.
mmap : ∀ {A B : Set} {M : Set → Set} {{_ : Monad M}} → (A → M B) → Maybe A → M (Maybe B)
mmap f None     = pure None
mmap f (Some x) = f x >>= λ y → pure (Some y)
