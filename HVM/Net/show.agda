module HVM.Net.show where

import HVM.Redex.show as Redex
import HVM.Term.show as Term
open import Data.List.Type
open import Data.List.map
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import HVM.Net.Type
open import HVM.Redex.Type

-- Converts a Net to its string representation.
-- - net: The Net to convert.
-- = A string representation of the Net.
show : Net → String
show net = do
  let root = Term.show (Net.root net)
  let rbag = join "" (map (λ r → " & " ++ Redex.show r) (Net.rbag net))
  root ++ rbag
