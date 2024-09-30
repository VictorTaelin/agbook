module Bend.Compile.NetToHvm.tree-to-hvm where

open import Base.Bool.if
open import Base.Function.case
open import Base.BitMap.BitMap
open import Base.BitMap.get renaming (get to map-get)
open import Base.BitMap.set renaming (set to map-set)
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.to-bits
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Bend.Net.Net renaming (Net to BNet)
open import Bend.Net.get-node
open import Bend.Net.get-port
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.Port.Port
open import Bend.Net.Port.to-bits renaming (to-bits to port-to-bits)
open import Bend.nat-to-name
open import HVM2.Net.Net renaming (Net to HNet)
open import HVM2.Term.Term renaming (Term to HTerm)
open import Bend.Compile.NetToHvm.State.State

mutual

  -- Converts a tree of nodes in the flattened net to an HVM term.
  -- - net: The flattened internal Bend compilation inet.
  -- - node-id: The id of the root node of the tree.
  -- - state: Compilation state with found variables and remaining gas.
  -- = A pair of the compiled term and the new compilation state.
  {-# TERMINATING #-} -- FIXME!
  tree-to-hvm : BNet → Nat → State → Result (Pair HTerm State) String
  -- We know that we should visit each node only once,
  -- so we can set a max number of nodes to visit.
  -- Cycles will end up visiting too many nodes and fail here.
  -- For some reason the termination checker doesn't seem to understand that.
  tree-to-hvm net node-id (MkState _ _ 0)                      = Fail "cycle in tree"
  tree-to-hvm net node-id (MkState vars n-vars (Succ n-nodes)) = do
    let state = MkState vars n-vars n-nodes
    (node , net) <- to-result (get-node net node-id) "node not found"
    let (MkNode main aux1 aux2 kind) = node
    case kind of λ where
      NodeKind.Con → do
        (lft , state) <- var-or-subtree-to-hvm net aux1 state
        (rgt , state) <- var-or-subtree-to-hvm net aux2 state
        Done (HTerm.Con lft rgt , state)
      NodeKind.Dup → do
        (lft , state) <- var-or-subtree-to-hvm net aux1 state
        (rgt , state) <- var-or-subtree-to-hvm net aux2 state
        Done (HTerm.Dup lft rgt , state)
      NodeKind.Era → do
        Done (HTerm.Era , state)
      NodeKind.Var → do
        let (var , state) = make-var (MkPort node-id 1) aux1 state
        Done (var , state)

      NodeKind.Rot → do
          Fail "attempted to compile root node"

      -- TODO: Not implemented in HVM2.
      (NodeKind.Num num) → do
        Done (HTerm.Era , state)
      (NodeKind.Ref name) → do
        Done (HTerm.Era , state)
      NodeKind.Opr → do
        Done (HTerm.Era , state)
      NodeKind.Swi → do
        (lft , state) <- var-or-subtree-to-hvm net aux1 state
        (rgt , state) <- var-or-subtree-to-hvm net aux2 state
        Done (HTerm.Con lft rgt , state)

  -- If the port points to a var, create and return a var term.
  -- If it points to a node, compile the subtree.
  var-or-subtree-to-hvm : BNet → Port → State → Result (Pair HTerm State) String
  var-or-subtree-to-hvm net port state =
    if Port.slot-id port == 0 then
      tree-to-hvm net (Port.node-id port) state
    else do
      port' <- to-result (get-port net port) "port not found"
      Done (make-var port port' state)

  -- Returns a var term for a side link in the inet.
  -- If the other side of the var was already found, use the name in the map.
  -- Otherwise, create a new name and add it to the map.
  make-var : Port → Port → State → Pair HTerm State
  make-var a b (MkState vars n-vars n-nodes) = do
    let key-a = port-to-bits a
    case map-get vars key-a of λ where
      (Some var) → (HTerm.Var var , MkState vars n-vars n-nodes)
      None → do
        let key-b  = port-to-bits b
        let name   = nat-to-name n-vars
        let n-vars = Succ n-vars
        let vars   = map-set vars key-a name
        let vars   = map-set vars key-b name
        (HTerm.Var name , MkState vars n-vars n-nodes)
