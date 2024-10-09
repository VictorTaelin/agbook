module Bend.Readback.NetToBend.is-tup where

open import Base.BitMap.BitMap
open import Base.BitMap.contains
open import Base.BitMap.del
open import Base.BitMap.empty
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.BitMap.to-list
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Function.case
open import Base.List.List
open import Base.List.is-nil
open import Base.Maybe.to-result
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Base.Unit.Unit
open import Bend.Net.Net
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.Port.Port
open import Bend.Net.Port.to-bits
open import Bend.Net.get-node
open import Bend.Net.get-port
open import Bend.Readback.NetToBend.Reader

-- Checks if a given node represents a tuple.
-- - r: The Reader containing the Net and other context.
-- - node: The node ID to check.
-- = True if the node represents a tuple, False otherwise.
is-tup : Reader → Nat → Result Bool String
is-tup r node = do
  let net = Reader.net r
  (MkNode _ a11 a12 k1) ← get-node net node
  (MkNode _ _   _   k2) ← get-node net (Port.node a11)
  case k1 , k2 of λ where
    -- Con with Era on port 1 is considered a lambda
    (Con , Era) → Done False
    -- Potentially a tuple
    (Con , _  ) → is-closed r (a11 :: a12 :: []) empty
    -- Non-Con node
    (_   , _  ) → Done False

  where

  -- Helper function to check if a net is a closed tree (a normalized combinator/package).
  -- - r: The Reader containing the Net and other context.
  -- - start: The starting port for the check.
  -- = True if the net is closed, False otherwise.
  is-closed : Reader → List Port → BitMap Unit → Result Bool String

  -- No hanging wires = a normalized combinator = a tuple
  is-closed r [] wires = do
    Done (is-nil (to-list wires))

  -- Entered through port 0, new node in the tree
  is-closed r ((MkPort node 0) :: ps) wires = do
    lft ← get-port (Reader.net r) (MkPort node 1)
    rgt ← get-port (Reader.net r) (MkPort node 2)
    is-closed r (lft :: rgt :: ps) wires

  -- Entered through aux port, a wire that we have to check
  is-closed r (port :: ps) wires = do
    other ← get-port (Reader.net r) port
    -- Mark as a wire. If already present, mark as visited by removing it.
    -- Insert both at once to avoid deciding on an order
    let wires = if (contains wires (to-bits port))
                  -- Found the other side of the wire
                  then (del (del wires (to-bits port)) (to-bits other))
                  -- New wire
                  else (set (set wires (to-bits port) unit) (to-bits other) unit)
    is-closed r ps wires
