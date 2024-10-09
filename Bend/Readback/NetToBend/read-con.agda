open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Bend.Fun.Term.Term
open import Bend.Net.Port.Port
open import Bend.Readback.NetToBend.Reader

module Bend.Readback.NetToBend.read-con
  (read-term : Reader → Port → Result (Pair Reader Term) String)
  where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Function.case
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Result.Monad.bind
open import Bend.Fun.FanKind.FanKind
open import Bend.Fun.Pattern.Pattern
open import Bend.Readback.NetToBend.gen-bnd
open import Bend.Readback.NetToBend.gen-var
open import Bend.Readback.NetToBend.is-tup

-- Reads a term from a CON node.
-- Could be a lambda, an application, a CON tuple or a CON tuple elimination.
-- TODO: Read back tuple elimination.
read-con : Reader → Port → Result (Pair Reader Term) String

-- If we're visiting a port 0, then it is a tuple or a lambda.
read-con r (MkPort node 0) = do
  is-tup ← is-tup r node
  if is-tup
    then (do
      (r , fst) ← read-term r (MkPort node 1)
      (r , snd) ← read-term r (MkPort node 2)
      Done (r , Fan FanKind.Tup (fst :: snd :: [])))
    else (do
      (r , nam) ← gen-bnd r (MkPort node 1)
      (r , bod) ← read-term r (MkPort node 2)
      Done (r , Lam (Pattern.Var nam) bod))

-- If we're visiting a port 1, then it's a variable.
read-con r (MkPort node 1) = do
  let (r , nam) = gen-var r (MkPort node 1)
  Done (r , Var nam)

-- If we're visiting a port 2, then it's an application.
read-con r (MkPort node 2) = do
  (r , fun) ← read-term r (MkPort node 1)
  (r , arg) ← read-term r (MkPort node 2)
  Done (r , App fun arg)

read-con r (MkPort node _) = do
  Fail "Invalid slot"
