open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Bend.Fun.Term.Term
open import Bend.Net.Port.Port
open import Bend.Readback.NetToBend.Reader

module Bend.Readback.NetToBend.read-dup
  (read-term : Reader → Port → Result (Pair Reader Term) String)
  where

open import Base.BitMap.contains
open import Base.BitMap.set
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Either.Either
open import Base.List.List
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.Pair.Pair
open import Base.Unit.Unit
open import Bend.Fun.FanKind.FanKind
open import Bend.Net.get-port
open import Bend.Net.Port.to-bits
open import Bend.Readback.NetToBend.gen-var
import Bend.Readback.NetToBend.read-aux-eta as read-aux-eta'

private
  open module read-aux-eta = read-aux-eta' read-term

-- Reads a fan term from a DUP node.
-- Could be a superposition or a duplication (dup tuple and tuple elimination).
read-dup : Reader → Port → Result (Pair Reader Term) String

-- If we're visiting a port 0, then it is a pair (superposition).
-- If this superposition is in a readback path with a paired Dup,
-- we resolve it by splitting the two sup values into the two Dup variables.
read-dup r@(MkReader _ _ _ _ False (slot :: path) _ _ _) (MkPort node 0) = do
  -- Found a paired Dup, so we "decay" the superposition according
  --  to the original direction we came from the Dup.
  let r = record r { path = path }
  (r , term) ← read-term r (MkPort node slot)
  let r = record r { path = slot :: (Reader.path r) }
  Done (r , term)

-- If we find that it's not paired with a Dup, we just keep the Sup as a term.
read-dup r (MkPort node 0) with (read-aux-eta r node)
... | (Done (r , (Lft term)))        = Done (r , term)
... | (Done (r , (Rgt (fst , snd)))) = Done (r , Fan FanKind.Dup (fst :: snd :: []))
... | (Fail err)                          = Fail err

-- If we're visiting a port 1 or 2, then it is a variable.
-- If doing non-linear readback, we also store the dup path to try to resolve it later.
read-dup r@(MkReader net _ _ _ False path _ _ _) (MkPort node slot) = do
  let r      = record r { path = slot :: path }
  nxt        ← get-port net (MkPort node 0)
  (r , term) ← read-term r nxt
  let r      = record r { path = path }
  Done (r , term)

-- Otherwise, if doing linear readback, we store the dup to process later and return the var.
read-dup r@(MkReader net _ _ _ True _ fans seen-fans _) port = do
  let fans , seen-fans =
        if (contains seen-fans (to-bits port))
          then ((Port.node port) :: fans , seen-fans)
          else (fans , set seen-fans (to-bits port) unit)
  let r , nam = gen-var r port
  Done (record r { fans = fans ; seen-fans = seen-fans } , Var nam)
