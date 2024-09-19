module Base.List.gt where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Trait.Ord

gt : ∀ {A : Set} → {{O : Ord A}} → List A → List A → Bool
gt {{O}} []        []        = False
gt {{O}} []        (_ :: _)  = False
gt {{O}} (_ :: _)  []        = True
gt {{O}} (x :: xs) (y :: ys) with _>_ {{O}} x y | _<_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = gt {{O}} xs ys
