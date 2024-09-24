module Base.Pair.show where

open import Base.Pair.Type
open import Base.String.Type
open import Base.String.append
import Base.Trait.Show as Show

show : ∀ {A B : Set} -> {{ShowA : Show.Show A}} -> {{ShowB : Show.Show B}} -> Pair A B -> String
show {{ShowA}} {{ShowB}} (a , b) = "(" ++ Show.to-string {{ShowA}} a ++ ", " ++ Show.to-string {{ShowB}} b ++ ")"
