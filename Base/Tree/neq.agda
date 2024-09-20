module Base.Tree.neq where

open import Base.Tree.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.Tree.eq as Tree
import Base.Trait.Eq as Eq

neq : ∀ {A : Set} → {{EqA : Eq.Eq A}} → Tree A → Tree A → Bool
neq t1 t2 = not (Tree.eq t1 t2)
