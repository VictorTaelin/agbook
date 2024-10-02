module Bend.Run.show-hvm where

open import Base.List.List
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import HVM.Mode.Mode
open import HVM.Net.Net
open import HVM.Redex.Redex
open import HVM.Redex.show renaming (show to show-redex)
open import HVM.Term.show renaming (show to show-term)

show-hvm : List (Pair String (Net NAMED)) → String
show-hvm [] = ""
show-hvm ((nam , net) :: nets) =
  "@" ++ nam ++ " = " ++ show-term (Net.root net) ++ "\n" ++ show-redexes (Net.rbag net) ++ show-hvm nets

  where

  show-redexes : List (Redex NAMED) → String
  show-redexes [] = ""
  show-redexes (r :: rs) = show-redex r ++ "\n" ++ show-redexes rs
