module Base.Pair.show where

open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
import Base.Trait.Show as Show

-- Converts a pair to a string representation.
-- 1st: Show instance for type A.
-- 2nd: Show instance for type B.
-- 3rd: The pair to be converted.
-- = A string in the format "(a, b)" where a and b are the string representations of the pair's elements.
show : ∀ {A B : Set} → {{ShowA : Show.Show A}} → {{ShowB : Show.Show B}} → Pair A B → String
show {{ShowA}} {{ShowB}} (a , b) = "(" ++ Show.to-string {{ShowA}} a ++ ", " ++ Show.to-string {{ShowB}} b ++ ")"
