module Base.Trait.Monad where

record Monad (M : Set → Set) : Set₁ where
  field
    bind : ∀ {A B : Set} → M A → (A → M B) → M B
    pure : ∀ {A : Set} → A → M A

open Monad {{...}} public

infixl 1 _>>=_ _>>_

_>>=_ : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set} → M A → (A → M B) → M B
_>>=_ {{monadM}} = bind {{monadM}}

_>>_ : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set} → M A → M B → M B
ma >> mb = ma >>= λ _ → mb

-- NOTE: in TypeScript, there ar eno higher kinded types, making the Monad
-- instance impossible to express. instead, and unfortunatelly, we should use
-- 'any' to disable the type system surgically for this specific type
