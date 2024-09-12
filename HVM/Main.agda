module HVM.Main where

open import Debug.Trace

import HVM.Net.show as Net
import HVM.Term.show as Term
open import Data.Bits.Type
open import Data.IO.Type
open import Data.IO.print
open import Data.List.Type
open import Data.Unit.Type
open import HVM.Net.Type
open import HVM.Redex.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.boot
open import HVM.Runtime.fresh
open import HVM.Runtime.get-state
open import HVM.Runtime.materialize
open import HVM.Runtime.normalize
open import HVM.Runtime.pure
open import HVM.Runtime.run
open import HVM.Runtime.set-state
open import HVM.State.Type
open import HVM.Term.Type

-- Creates a demo net
test : Runtime Term
test = do
  -- creates vars
  rt <- fresh
  x0 <- fresh
  x1 <- fresh
  x2 <- fresh
  -- creates net
  let root = (Var rt)
  let tm-0 = Con (Con (Var x2) (Var x2)) (Var rt)
  let tm-1 = Con (Var x1) (Var x1)
  let rx-0 = MkRedex tm-0 tm-1
  let rbag = rx-0 :: []
  -- boot the net
  boot (MkNet rbag root)
  -- normalize the net
  normalize
  -- expand the normal form
  nf <- materialize root
  -- return it
  pure nf

-- Main function that creates a demo net and prints it
main : IO Unit
main = print (Term.show (run test))
