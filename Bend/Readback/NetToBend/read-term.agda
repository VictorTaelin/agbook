module Bend.Readback.NetToBend.read-term where

open import Base.BitMap.contains
open import Base.BitMap.set
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.if
open import Base.Function.case
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Base.Unit.Unit
open import Bend.Fun.Term.Term
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.Port.Port
open import Bend.Net.Port.to-bits
open import Bend.Net.get-node
open import Bend.Readback.NetToBend.Reader
import Bend.Readback.NetToBend.read-con as read-con'
import Bend.Readback.NetToBend.read-dup as read-dup'
import Bend.Readback.NetToBend.read-swi as read-swi'

-- Reads a term from a port in the net.
-- - r : The current reader state.
-- - port : The port to read from.
-- = A pair of the updated reader state and the term read from the port.
read-term : Reader → Port → Result (Pair Reader Term) String

private
  open module read-con = read-con' read-term
  open module read-dup = read-dup' read-term
  open module read-swi = read-swi' read-term

read-term r port = do
  let seen = Reader.seen r
  _ ← if (contains seen (to-bits port)) && (Reader.linear r)
    then Fail "Cycle detected in linear readback"
    else Done unit
  let seen = set seen (to-bits port) unit
  let r = record r { seen = seen }
  (MkNode _ _ _ kind) ← get-node (Reader.net r) (Port.node port)
  case kind of λ where
    NodeKind.Con       → read-con r port
    NodeKind.Dup       → read-dup r port
    NodeKind.Era       → Done (r , Era)
    (NodeKind.Ref nam) → Done (r , Ref nam)
    (NodeKind.Num _)   → Fail "Not implemented"
    NodeKind.Swi       → read-swi r port
    NodeKind.Opr       → Fail "Not implemented"
    NodeKind.Var       → Fail "Found var node in readback"
    NodeKind.Rot       → Fail "Reached root node"
