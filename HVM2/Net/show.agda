module HVM2.Net.show where

import HVM2.Redex.show as Redex
import HVM2.Term.show as Term
open import Base.List.List
open import Base.List.map
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import HVM2.Net.Net
open import HVM2.Redex.Redex

-- Converts a Net to its string representation.
-- - net: The Net to convert.
-- = A string representation of the Net.
show : Net -> String
show net = do
  let root = Term.show (Net.root net)
  let rbag = join "" (map (λ r -> " & " ++ Redex.show r) (Net.rbag net))
  root ++ rbag
