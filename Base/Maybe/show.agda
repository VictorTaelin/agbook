module Base.Maybe.show where

open import Base.Maybe.Maybe
open import Base.String.String
open import Base.String.append
import Base.Trait.Show as Show

show : ∀ {A : Set} → {{ShowA : Show.Show A}} → Maybe A → String
show {{ShowA}} None     = "None"
show {{ShowA}} (Some x) = "Some(" ++ Show.to-string {{ShowA}} x ++ ")"

