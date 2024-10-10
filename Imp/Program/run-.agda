module Imp.Program.run- where

import Base.Nat.neq as Nat
open import Base.Bool.Bool
import Base.Buffer.new as Buffer
import Base.Buffer.to-list as Buffer
import Base.List.all-true as List
import Base.List.map as List
import Base.List.replicate as List
import Base.Nat.mod as Nat
import Base.Nat.range as Nat
import Base.U64.from-nat as U64
import Base.U64.to-nat as U64
open import Base.Equal.Equal
open import Base.List.List
open import Base.Nat.Nat
open import Base.Result.Result
open import Base.String.append
open import Base.String.String
open import Base.U64.U64
open import Imp.Notation
open import Imp.Program.Grid.Grid
open import Imp.Program.Program
open import Imp.Program.run
open import Imp.Stmt.Stmt

-- Runs a program and returns the global buffer as a list.
unsafe-run : Program → List U64
unsafe-run program with (run program)
... | Done buffer = Buffer.to-list buffer
... | Fail string = []

-- An empty program should have a global buffer of 0s.
_ : unsafe-run (MkProgram 256 []) ≡ List.replicate 256 (U64.from-nat 0)
_ = refl

-- Fills global memory with [0, 1, 2, ..., N].
fill : Stmt
fill = do
  global[ gid ]= gid

fill-grid : Grid
fill-grid = MkGrid 0 16 16 fill

-- This program should output a global buffer with range [0, ..., 256].
_ : unsafe-run (MkProgram 256 (fill-grid :: [])) ≡ List.map U64.from-nat (Nat.range 0 256)
_ = refl

-- Assuming a global buffer filled with [0, ..., 256], this sets all values
-- in the global buffer to 0 if they are not prime.
sieve : Stmt
sieve = do
  local ("i" :: [])

  global[ gid ]= gid

  if (gid < # 2) then
    return # 0
   else
    noop

  "i" := gid * # 2

  while ($"i" < # 256) go do
    global[ $"i" ]= # 0
    "i" += gid

-- A program that outputs a global memory buffer of primes.
sequence : List Grid
sequence = (MkGrid 0 16 16 fill) :: (MkGrid 0 16 16 sieve) :: []

is-prime : Nat → Bool
is-prime 0 = True
is-prime 1 = True
is-prime 2 = True
is-prime n = List.all-true (λ d → Nat.neq (Nat.mod n d) 0) (Nat.range 2 n)

zero-if-composite : Nat → Nat
zero-if-composite n with (is-prime n)
... | True  = n
... | False = 0

_ : unsafe-run (MkProgram 256 sequence) ≡ List.map (λ n → U64.from-nat (zero-if-composite n)) (Nat.range 0 256)
_ = refl
