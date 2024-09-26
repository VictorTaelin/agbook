module Base.List.lt where

open import Base.List.List
open import Base.Bool.Bool
import Base.Trait.Ord as Ord

lt : ∀ {A : Set} -> {{O : Ord.Ord A}} -> List A -> List A -> Bool
lt {{O}} []        []        = False
lt {{O}} []        (_ :: _)  = True
lt {{O}} (_ :: _)  []        = False
lt {{O}} (x :: xs) (y :: ys) with Ord._<_ {{O}} x y | Ord._>_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = lt {{O}} xs ys

infix 4 _<_
_<_ : ∀ {A : Set} -> {{O : Ord.Ord A}} -> List A -> List A -> Bool
_<_ = lt
