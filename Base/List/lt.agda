module Base.List.lt where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Trait.Ord

lt : ∀ {A : Set} → {{O : Ord A}} → List A → List A → Bool
lt {{O}} []        []        = False
lt {{O}} []        (_ :: _)  = True
lt {{O}} (_ :: _)  []        = False
lt {{O}} (x :: xs) (y :: ys) with _<_ {{O}} x y | _>_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = lt {{O}} xs ys
