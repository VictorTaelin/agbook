module Test.T1 where

open import Base.Maybe.Type
open import Base.Maybe.Monad.bind
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Equal.Type

-- A simple test function using the Maybe monad with do-notation
main : Maybe Nat
main = do
  x <- Some 3
  y <- Some 4
  Some (x + y)
