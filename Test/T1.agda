module Test.T1 where

open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Equal.Type

-- A simple test function using the Maybe monad with do-notation
main : Maybe Nat
main = do
  x ← some 3
  y ← some 4
  some (x + y)
