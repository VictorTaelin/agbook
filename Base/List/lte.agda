module Base.List.lte where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Trait.Ord

lte : ∀ {A : Set} → {{O : Ord A}} → List A → List A → Bool
lte {{O}} []        []        = True
lte {{O}} []        (_ :: _)  = True
lte {{O}} (_ :: _)  []        = False
lte {{O}} (x :: xs) (y :: ys) with _<_ {{O}} x y | _>_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = lte {{O}} xs ys
