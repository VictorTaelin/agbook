module Bend.Net.show where

open import Base.String.Type
open import Base.String.append
open import Base.Nat.Type
open import Base.Nat.Trait.Show
open import Base.BitMap.to-list
open import Base.Pair.Type
open import Base.Bits.Type
open import Base.Bits.to-nat
open import Base.List.foldr
open import Base.List.map
open import Bend.Net.Type
open import Bend.Net.Node.Type
open import Bend.Net.Node.show
open import Base.Trait.Show

instance
  ShowNet : Show Net
  ShowNet = record { to-string = show-net }
    where
      show-net : Net -> String
      show-net (MkNet nodes len name) =
        let nodes = foldr append "" (map show-node-entry (to-list nodes)) in
        "@" ++ name ++ " =\n" ++ nodes
        where
          show-node-entry : (Pair Bits Node) -> String
          show-node-entry (id , node) =
            show (to-nat id) ++ ": " ++ show node ++ "\n"
