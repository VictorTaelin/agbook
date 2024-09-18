module HVM1.Node.port-mut where

-- NOTE: do *NOT* fix the style of this file

open import Data.Bits.Type
open import Data.Nat.Type
open import Data.Unit.Type
open import Data.Maybe.Type
open import Data.Function.case
open import HVM1.Net.Type
open import HVM1.Node.Type
open import HVM1.Node.port-get
open import HVM1.Node.port-set
open import HVM1.Port.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.state-mut
import Data.Map.Type as M
import Data.Map.get as M
import Data.Map.set as M

-- Mutates the port of a node at a given slot in the HVM1 system.
-- - addr: The address of the node to modify.
-- - slot: The slot number (0, 1, or 2).
-- - port: The new port to set.
-- = A Run computation that modifies the node's port at the specified slot.
port-mut : Bits → Nat → Port → Run Unit
port-mut addr slot port = state-mut λ state →
  let net = Net.net (State.net state)
      maybe-node = M.get net addr
  in 
    let new-net = 
          case maybe-node of λ where
            None → net  -- Node not found, return unchanged net
            (Some node) →
              let new-node = port-set node slot port
              in M.set net addr new-node
    in record state { net = record (State.net state) { net = new-net } }
