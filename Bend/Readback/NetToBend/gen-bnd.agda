module Bend.Readback.NetToBend.gen-bnd where

open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.Port.Port
open import Bend.Net.get-node
open import Bend.Net.get-port
open import Bend.Readback.NetToBend.Reader
open import Bend.Readback.NetToBend.gen-var

gen-bnd : Reader → Port → Result (Pair Reader (Maybe String)) String
gen-bnd reader port = do
  let net = Reader.net reader
  (MkPort node _)     ← get-port net port
  (MkNode _ _ _ kind) ← get-node net node
  case kind of λ where
    Era → do
      Done (reader , None)
    _   → do
      let (reader , nam) = gen-var reader port
      Done (reader , Some nam)
