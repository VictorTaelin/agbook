module Base.Maybe.some where

open import Base.Maybe.Maybe

-- Constructs a Some value, representing the presence of a value
some : ∀ {a} {A : Set a} → A → Maybe A
some = Some

