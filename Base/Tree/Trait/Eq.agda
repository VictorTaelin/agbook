module Base.Tree.Trait.Eq where

open import Base.Tree.Type
import Base.Tree.eq as Tree
import Base.Tree.neq as Tree
import Base.Trait.Eq as Eq

instance
  EqTree : ∀ {A : Set} {{EqA : Eq.Eq A}} → Eq.Eq (Tree A)
  EqTree {{EqA}} = record
    { eq = Tree.eq
    ; neq = Tree.neq
    }
