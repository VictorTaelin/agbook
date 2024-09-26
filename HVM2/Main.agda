module HVM2.Main where

open import Debug.Trace

import HVM2.Net.show as Net
import HVM2.Term.show as Term
open import Base.Bits.Bits
open import Base.IO.IO
open import Base.IO.print
open import Base.List.List
open import Base.Unit.Unit
open import HVM2.Net.Net
open import HVM2.Redex.Redex
open import HVM2.Run.Run
open import HVM2.Run.Monad.bind
open import HVM2.Run.boot
open import HVM2.Run.fresh
open import HVM2.Run.state-get
open import HVM2.Run.materialize
open import HVM2.Run.normalize
open import HVM2.Run.Monad.pure
open import HVM2.Run.run
open import HVM2.Run.state-set
open import HVM2.Run.State.State
open import HVM2.Term.Term

-- Creates a demo net
test : Run Term
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
main = print ("OI")
