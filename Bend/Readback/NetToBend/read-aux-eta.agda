open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Bend.Fun.Term.Term
open import Bend.Net.Port.Port
open import Bend.Readback.NetToBend.Reader

module Bend.Readback.NetToBend.read-aux-eta
  (read-term : Reader → Port → Result (Pair Reader Term) String)
  where

open import Base.Bool.if
open import Base.Bool.and
open import Base.Either.Either
open import Base.Function.case
open import Base.List.filter
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Nat.Nat
open import Base.Result.Monad.bind
open import Bend.Net.Net
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.get-node
open import Bend.Net.get-port
import Base.Nat.eq as Nat
import Base.Nat.neq as Nat
import Bend.Net.NodeKind.eq as Kind

-- Enters both ports 1 and 2 of a node. Returns a Term if it is
-- possible to simplify the net, or the Terms on the two ports of the
-- node.
-- The two possible outcomes are always equivalent.
--
-- If:
--  - The node Kind is CON/TUP/DUP
--  - Both ports 1 and 2 are connected to the same node on slots 1 and 2 respectively
--  - That node Kind is the same as the given node Kind
--
-- Then:
--   Reads the port 0 of the connected node, and returns that term.
--
-- Otherwise:
--   Returns the terms on ports 1 and 2 of the given node.
--
-- # Example
--
-- ```hvm
-- // λa let (a, b) = a; (a, b)
-- ([a b] [a b])
--
-- // The node `(a, b)` is just a reconstruction of the destructuring of `a`,
-- // So we can skip both steps and just return the "value" unchanged:
--
-- // λa a
-- (a a)
-- ```
--
-- - reader: The current state of the readback process.
-- - node: The node ID to read back.
-- = The updated Reader and Either a single Term (if eta-reduction is possible)
--   or the two Terms on the aux ports.
read-aux-eta : Reader → Nat → Result (Pair Reader (Either Term (Pair Term Term))) String
read-aux-eta reader node = do
  let net  = Reader.net reader
  this     ← get-node net node
  let kind = Node.kind this
  case kind of λ where
    NodeKind.Con → try-eta-reduce reader node kind
    NodeKind.Dup → try-eta-reduce reader node kind
    _            → read-aux reader node
  where

  read-aux : Reader → Nat → Result (Pair Reader (Either Term (Pair Term Term))) String
  read-aux reader node = do
    (reader , term1) ← read-term reader (MkPort node 1)
    (reader , term2) ← read-term reader (MkPort node 2)
    Done (reader , Rgt (term1 , term2))

  -- Either eta-reduce the node and read the other side ,
  -- or read the terms of the two aux ports if not eta-reducible.
  try-eta-reduce : Reader → Nat → NodeKind → Result (Pair Reader (Either Term (Pair Term Term))) String
  try-eta-reduce reader node kind = do
    let net = Reader.net reader
    (MkPort node2 slot2) ← get-port net (MkPort node 2)
    (MkPort node1 slot1) ← get-port net (MkPort node 1)
    (MkNode _ _ _ kind2) ← get-node net node1

    if (Nat.eq node1 node2) && (Kind.eq kind kind2) && (Nat.eq slot1 1) && (Nat.eq slot2 2)
      -- Eta reduce
      then (do
        let fans        = filter (λ n → Nat.neq node n) (Reader.fans reader)
        let reader      = record reader { fans = fans }
        nxt             ← get-port net (MkPort node1 0)
        (reader , term) ← read-term reader nxt
        Done (reader , Lft term))
      -- Not eta-reducible, just read both terms
      else do
        read-aux reader node
