module Data.Bits.Test.test where

open import Data.Bits.Type
open import Data.Bits.strip
open import Data.Bits.to-nat
open import Data.Bits.show renaming (show to showB)
open import Data.Bits.eq
open import Data.Nat.show
open import Data.IO.Type
open import Data.IO.print
open import Data.IO.seq
open import Data.String.Type
open import Data.String.append
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.eq renaming (_==_ to _b==_)


open import Data.Bits.gt
open import Data.Bits.from-nat
open import Data.Nat.Type

test-gt : Nat → Nat → Bool → IO _
test-gt a b expected = do
  let bitsA = from-nat a
  let bitsB = from-nat b
  let result = bitsA > bitsB
  print ("Testing: " ++ show a ++ " (" ++ showB bitsA ++ ") > " ++ show b ++ " (" ++ showB bitsB ++ ")")
  print ("Result:    " ++ (if result then "True" else "False"))
  print ("Expected:  " ++ (if expected then "True" else "False"))
  print ("Correct:   " ++ (if result b== expected then "Yes" else "No"))
  print ""

main : IO _
main = do
  print "Testing gt function:"
  print ""
  test-gt 0 0 False
  test-gt 1 0 True
  test-gt 0 1 False
  test-gt 2 1 True
  test-gt 1 2 False
  test-gt 7 8 False
  test-gt 8 7 True
  test-gt 15 16 False
  test-gt 16 15 True
  test-gt 42 42 False
  test-gt 1042 58 True
