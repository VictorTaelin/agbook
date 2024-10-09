module Imp.Stmt.show- where

open import Imp.Expr.Expr
open import Imp.Stmt.Stmt
open import Imp.Notation
open import Imp.Stmt.show as Stmt
open import Base.Nat.Nat
open import Base.U64.U64
open import Base.Nat.to-u64
open import Base.List.List
open import Base.Equal.Equal

private
  # : Nat → Expr
  # n = Num (to-u64 n)

fib : Expr → Stmt
fib n = do
  local ("a" :: "b" :: [])

  "a" := # 0
  "b" := # 1
  "n" := n

  while $"n" > # 0 go do
    "t" := $"b"
    "b" := $"a" + $"b"
    "a" := $"t"
    "n" -= # 1

  return $"a"

example : Stmt
example = do
  local ("fib1" :: "fib2" :: [])

  Call "fib1" (fib (# 1))
  Call "fib2" (fib (# 2))

expected-string = "local fib1, fib2
fib1 = ({
  local a, b
  a = 0U
  b = 1U
  n = 1U
  while (n > 0U) {
    t = b
    b = a + b
    a = t
    n = n - 1U
  }
  return a
})
fib2 = ({
  local a, b
  a = 0U
  b = 1U
  n = 2U
  while (n > 0U) {
    t = b
    b = a + b
    a = t
    n = n - 1U
  }
  return a
})"

test-example : (Stmt.show example) ≡ expected-string
test-example = refl

