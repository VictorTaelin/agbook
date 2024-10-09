module Bend.Net.get-port where

open import Base.Maybe.to-result
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Bend.Net.Net
open import Bend.Net.Port.Port
import Base.BinMap.get as BinMap
import Base.Nat.to-bits as Nat
import Bend.Net.Node.get as Node

get-port : Net → Port → Result Port String
get-port (MkNet nodes len name) (MkPort node slot) = do
  let key = Nat.to-bits node
  a <- to-result (BinMap.get nodes key) "Port not found"
  p <- to-result (Node.get a slot) "Invalid slot"
  Done p
