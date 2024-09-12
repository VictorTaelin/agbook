module Data.List.show where

open import Data.List.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show public

instance
  ShowList : ∀ {A : Set} {{ShowA : Show A}} → Show (List A)
  ShowList {{ShowA}} = record { to-string = show-list }
    where
      show-list : List _ → String
      show-list [] = "[]"
      show-list (x :: xs) = "[" ++ to-string{{ShowA}} x ++ show-rest xs
        where
          show-rest : List _ → String
          show-rest [] = "]"
          show-rest (y :: ys) = ", " ++ to-string{{ShowA}} y ++ show-rest ys