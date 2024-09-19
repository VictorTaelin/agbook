module Base.List.gte where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Ord.Trait

gte : ∀ {A : Set} → {{O : Ord A}} → List A → List A → Bool
gte {{O}} []        []        = True
gte {{O}} []        (_ :: _)  = False
gte {{O}} (_ :: _)  []        = True
gte {{O}} (x :: xs) (y :: ys) with _>_ {{O}} x y | _<_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = gte {{O}} xs ys
