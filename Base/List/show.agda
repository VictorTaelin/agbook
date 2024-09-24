module Base.List.show where

open import Base.List.Type
open import Base.String.Type
open import Base.String.append
import Base.Trait.Show as Show

show : ∀ {A : Set} -> {{ShowA : Show.Show A}} -> List A -> String
show [] = "[]"
show (x :: xs) = "[" ++ Show.to-string x ++ show-rest xs
  where
    show-rest : List _ -> String
    show-rest [] = "]"
    show-rest (y :: ys) = ", " ++ Show.to-string y ++ show-rest ys
