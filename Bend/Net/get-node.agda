module Bend.Net.get-node where

open import Base.BinMap.get
open import Base.Maybe.to-result
open import Base.Nat.Nat
open import Base.Nat.to-bits
open import Base.Result.Result
open import Base.String.String
open import Bend.Net.Net
open import Bend.Net.Node.Node

get-node : Net → Nat → Result Node String
get-node (MkNet nodes _ _) node = to-result (get nodes (to-bits node)) "Node not found"
