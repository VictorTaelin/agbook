module Base.List.gte where

open import Base.List.List
open import Base.Bool.Bool
import Base.Trait.Ord as Ord

gte : ∀ {A : Set} → {{O : Ord.Ord A}} → List A → List A → Bool
gte {{O}} []        []        = True
gte {{O}} []        (_ :: _)  = False
gte {{O}} (_ :: _)  []        = True
gte {{O}} (x :: xs) (y :: ys) with Ord._>_ {{O}} x y | Ord._<_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = gte {{O}} xs ys

infix 4 _>=_
_>=_ : ∀ {A : Set} → {{O : Ord.Ord A}} → List A → List A → Bool
_>=_ = gte

