module Imp.Eval.State.Block.new where

import Base.Buffer.new as Buffer
import Imp.Eval.State.Thread.new as Thread
open import Base.List.List
open import Base.List.map
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Nat.Nat
open import Base.Nat.range
open import Base.Nat.to-u64
open import Base.Queue.Queue
open import Imp.Eval.State.Block.Block
open import Imp.Stmt.Stmt

-- Creates a new block state given a block id, shared memory size, the number of threads,
-- and code to run. The number of blocks (the first parameter) is used to compute global
-- ids for the threads.
new : (blocks : Nat) → (bid : Nat) → (shared : Nat) → (threads : Nat) → (code : Stmt) → Block
new blocks bid shared threads code = do
  let threads = map (λ tid → Thread.new tid (tid + bid * blocks) code) (range 0 threads)
  MkBlock (to-u64 bid) (Buffer.new shared) (MkQueue threads [])
