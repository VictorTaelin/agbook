module Base.Trait.Monad where

record Monad (M : Set → Set) : Set₁ where
  field
    bind : ∀ {A B : Set} → M A → (A → M B) → M B
    pure : ∀ {A : Set} → A → M A

open Monad {{...}} public

_>>=_ : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set} → M A → (A → M B) → M B
_>>=_ {{monadM}} = bind {{monadM}}

infixl 1 _>>=_ _>>_

seq : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set} → M A → M B → M B
seq ma mb = ma >>= λ _ → mb

_>>_ : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set} → M A → M B → M B
_>>_ = seq
