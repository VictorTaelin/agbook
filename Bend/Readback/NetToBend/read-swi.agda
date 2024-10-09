open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Bend.Fun.Term.Term
open import Bend.Net.Port.Port
open import Bend.Readback.NetToBend.Reader

module Bend.Readback.NetToBend.read-swi
  (read-term : Reader → Port → Result (Pair Reader Term) String)
  where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Function.case
open import Base.List.List
open import Base.List.head
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Result.Monad.bind
open import Base.String.append
open import Base.Unit.Unit
open import Bend.is-generated-name
open import Bend.Fun.Book.get-def
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.get-node
open import Bend.Net.get-port
open import Bend.Readback.NetToBend.gen-var
open import Bend.Transform.subst
import Bend.Fun.Pattern.Pattern as Pattern
import Bend.Net.NodeKind.eq as Kind
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

  invalid-swi-msg : String
  invalid-swi-msg = "Encountered an invalid 'switch' term"

  expand-swi-succ : Reader → String → Result Term String
  expand-swi-succ r nam with is-generated-name nam
  ... | False = Done (Ref nam)
  ... | True  = do
    def ← get-def (Reader.book r) nam
    rule ← to-result (head (FnDef.rules def)) "no body"
    Done (Rule.body rule)

-- Reads a switch term from a SWI node
read-swi : Reader → Port → Result (Pair Reader Term) String
read-swi r (MkPort node 2) = do
  let net     = Reader.net r
  arg         ← get-port net (MkPort node 0)
  r , arg     ← read-term r (MkPort node 0)
  let r , bnd = case arg of λ where
    (Var bnd) → r , bnd
    _         → gen-var r (MkPort node 0)
  (MkPort selector _)     ← get-port net (MkPort node 1)
  (MkNode _ _ _ sel-kind) ← get-node net selector
  _ ← if (Kind.eq sel-kind NodeKind.Con) then (Done unit) else Fail invalid-swi-msg

  zero ← get-port net (MkPort selector 1)
  succ ← get-port net (MkPort selector 2)
  r , zero ← read-term r zero
  r , succ ← read-term r succ
  -- TODO: We probably need to expand recursively, but I don't think
  -- the bad cases actually occur in normal compilation, e.g.:
  -- `switch arg { 0: ...; _: ref_to_ref }`
  succ ← case succ of λ where
    (Ref nam) → expand-swi-succ r nam
    _         → Done succ

  -- Succ term should be a lambda
  succ ← case succ of λ where
    (Lam (Pattern.Var (Some nam)) bod) → Done (subst nam (Var (bnd ++ "-1")) bod)
    (Lam (Pattern.Var None)       bod) → Done bod
    _                          → Fail invalid-swi-msg
  let term = Swt (Some bnd) arg [] [] None (zero :: succ :: [])
  Done (r , term)

read-swi r (MkPort node _) = Fail invalid-swi-msg
