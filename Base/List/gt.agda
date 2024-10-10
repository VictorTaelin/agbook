module Base.List.gt where

open import Base.List.List
open import Base.Bool.Bool
import Base.Trait.Ord as Ord

gt : ∀ {A : Set} → {{O : Ord.Ord A}} → List A → List A → Bool
gt {{O}} []        []        = False
gt {{O}} []        (_ :: _)  = False
gt {{O}} (_ :: _)  []        = True
gt {{O}} (x :: xs) (y :: ys) with Ord._>_ {{O}} x y | Ord._<_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = gt {{O}} xs ys

infix 4 _>_
_>_ : ∀ {A : Set} → {{O : Ord.Ord A}} → List A → List A → Bool
_>_ = gt

