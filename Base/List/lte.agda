module Base.List.lte where

open import Base.List.List
open import Base.Bool.Bool
import Base.Trait.Ord as Ord

lte : ∀ {A : Set} -> {{O : Ord.Ord A}} -> List A -> List A -> Bool
lte {{O}} []        []        = True
lte {{O}} []        (_ :: _)  = True
lte {{O}} (_ :: _)  []        = False
lte {{O}} (x :: xs) (y :: ys) with Ord._<_ {{O}} x y | Ord._>_ {{O}} x y
... | True  | _     = True
... | False | True  = False
... | False | False = lte {{O}} xs ys

infix 4 _<=_
_<=_ : ∀ {A : Set} -> {{O : Ord.Ord A}} -> List A -> List A -> Bool
_<=_ = lte
