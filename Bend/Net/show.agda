module Bend.Net.show where

open import Data.String.Type
open import Data.String.append
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Map.to-list
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.List.foldr
open import Data.List.map
open import Bend.Net.Type
open import Bend.Net.Node.Type
open import Bend.Net.Node.show
open import Data.Trait.Show public

instance
  ShowNet : Show Net
  ShowNet = record { to-string = show-net }
    where
      show-net : Net → String
      show-net (MkNet nodes len name) =
        let nodes = foldr append "" (map show-node-entry (to-list nodes)) in
        "@" ++ name ++ " =\n" ++ nodes
        where
          show-node-entry : (Pair Bits Node) → String
          show-node-entry (id , node) =
            show (to-nat id) ++ ": " ++ show node ++ "\n"
