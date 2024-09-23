module Base.TreeBin.neq where

import Base.Trait.Eq as Eq
import Base.TreeBin.eq as TreeBin
open import Base.Bool.not
open import Base.Bool.Type
open import Base.TreeBin.Type

neq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → TreeBin A → TreeBin A → Bool
neq t1 t2 = not (TreeBin.eq t1 t2)

infix 4 _!=_
_!=_ : ∀ {A : Set} → {{EqA : Eq.Eq A}} → TreeBin A → TreeBin A → Bool
_!=_ = neq
