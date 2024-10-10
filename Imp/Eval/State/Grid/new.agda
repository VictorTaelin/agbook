module Imp.Eval.State.Grid.new where

import Imp.Eval.State.Block.new as Block
open import Base.Buffer.Buffer
open import Base.List.List
open import Base.List.map
open import Base.Nat.Nat
open import Base.Nat.range
open import Base.Queue.Queue
open import Imp.Eval.State.Grid.Grid
open import Imp.Stmt.Stmt

-- Creates a new grid state given a global memory buffer and a configuration of blocks.
new : (global : Buffer) → (shared : Nat) → (blocks : Nat) → (threads : Nat) → (code : Stmt) → Grid
new global shared blocks threads code = do
  let blocks = map (λ bid → Block.new blocks bid shared threads code) (range 0 blocks)
  MkGrid global (MkQueue blocks [])
