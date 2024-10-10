module HVM.Net.show where

import HVM.Redex.show as Redex
import HVM.Term.show as Term
open import Base.List.List
open import Base.List.map
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import HVM.Net.Net
open import HVM.Redex.Redex

-- Converts a Net to its string representation.
-- - net: The Net to convert.
-- = A string representation of the Net.
show : Net → String
show net = do
  let root = Term.show (Net.root net)
  let rbag = join "" (map (λ r → " & " ++ Redex.show r) (Net.rbag net))
  root ++ rbag

