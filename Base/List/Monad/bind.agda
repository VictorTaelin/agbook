module Base.List.Monad.bind where

open import Base.List.Type
open import Base.List.append

-- The bind function for the List monad.
-- - xs: The input list.
-- - fn: The function to apply to each element.
-- = The result of applying fn to each element and concatenating.
bind : ∀ {A B : Set} → List A → (A → List B) → List B
bind []        fn = []
bind (x :: xs) fn = fn x ++ bind xs fn

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → List A → (A → List B) → List B
_>>=_ = bind

infixl 1 _>>=_
