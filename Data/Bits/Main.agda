module Data.Bits.Main where

open import Data.Bits.Type
open import Data.Bits.add
open import Data.Bits.sub
open import Data.Bits.inc
open import Data.Bits.dec
open import Data.Bits.mul
open import Data.Bits.div
open import Data.Bits.or
open import Data.Bits.not
open import Data.Bits.xor
open import Data.Bits.rshift
open import Data.Bits.lshift
open import Data.Bits.eq
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.put-str-ln
open import Data.String.Type
open import Data.String.append
open import Data.Nat.show
open import Data.Bits.to-nat
open import Data.Maybe.Type
open import Data.Bool.Type
open import Data.Bool.if

showB : Bits → String
showB E        = "e"
showB (O bits) = showB bits ++ "0"
showB (I bits) = showB bits ++ "1"

showMaybeBits : Maybe Bits → String
showMaybeBits None = "None"
showMaybeBits (Some bits) = showB bits

-- Test function
test : IO _
test = do
  let a = I (O (I E))  -- 101 in binary (5 in decimal)
  let b = I (I (O E))  -- 011 in binary (3 in decimal)
   
  put-str-ln ("a = " ++ showB a ++ " (decimal: " ++ show (to-nat a) ++ ")")
  put-str-ln ("b = " ++ showB b ++ " (decimal: " ++ show (to-nat b) ++ ")")

  let inc_a = inc a
  put-str-ln ("inc a = " ++ showB inc_a ++ " (decimal: " ++ show (to-nat inc_a) ++ ")")

  let dec_b = dec b
  put-str-ln ("dec b = " ++ showB dec_b ++ " (decimal: " ++ show (to-nat dec_b) ++ ")")

  let a_plus_b = a + b
  put-str-ln ("a + b = " ++ showB a_plus_b ++ " (decimal: " ++ show (to-nat a_plus_b) ++ ")")

  let a_minus_b = a - b
  put-str-ln ("a - b = " ++ showB a_minus_b ++ " (decimal: " ++ show (to-nat a_minus_b) ++ ")")

  let a_mul_b = a * b
  put-str-ln ("a * b = " ++ showB a_mul_b ++ " (decimal: " ++ show (to-nat a_mul_b) ++ ")")

  let c = O (I (I E))  -- 110 in binary (6 in decimal)
  put-str-ln ("c = " ++ showB c ++ " (decimal: " ++ show (to-nat c) ++ ")")

  -- DIV is the only problem

  let c_div_b = c / b
  put-str-ln ("c / b = " ++ (showB c_div_b))

  -- New tests for logical gates
  let a_or_b = a || b
  put-str-ln ("a || b = " ++ showB a_or_b ++ " (decimal: " ++ show (to-nat a_or_b) ++ ")")

  let not_a = ~ a
  put-str-ln ("~a = " ++ showB not_a ++ " (decimal: " ++ show (to-nat not_a) ++ ")")

  let a_xor_b = a ^ b
  put-str-ln ("a ^ b = " ++ showB a_xor_b ++ " (decimal: " ++ show (to-nat a_xor_b) ++ ")")

  let a_eq_b = a == b
  put-str-ln ("a == b = " ++ (if a_eq_b then "True" else "False"))

  let a_eq_a = a == a
  put-str-ln ("a == a = " ++ (if a_eq_a then "True" else "False"))

main : IO _
main = test
