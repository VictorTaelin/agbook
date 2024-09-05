module Data.Bits.Test.test where

open import Data.Bits.Type
open import Data.Bits.sub
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.show renaming (show to showB)
open import Data.Bits.eq
open import Data.Bits.gt
open import Data.Bits.lt
open import Data.Nat.Type
open import Data.Nat.sub renaming (sub to nat-sub; _-_ to _n-_)
open import Data.Nat.show
open import Data.IO.Type
open import Data.IO.print
open import Data.IO.seq
open import Data.String.Type
open import Data.String.append
open import Data.Bool.Type
open import Data.Bool.if

main : IO _
main = do
  -- Subtraction using Bits
  let bits-result = (from-nat 5) - (from-nat 3)
  let bits-nat-result = to-nat bits-result
  
  -- Subtraction using Nat
  let nat-result = nat-sub 5 3
  
  -- Convert results to strings
  let bits-result-str = show bits-nat-result
  let nat-result-str = show nat-result
  
  -- Print results
  print ("Bits subtraction result (5 - 3): " ++ bits-result-str)
  print ("Nat subtraction result (5 - 3): " ++ nat-result-str)
  
  -- Print bit representation of the result (5 - 3)
  print ("Bit representation of (5 - 3): " ++ showB bits-result)
  
  -- Print bit string for from-nat 0
  print ("Bit string for from-nat 0: " ++ showB (from-nat 0))

  -- Bit comparison of 5 and 3
  let bits5 = from-nat 5
  let bits3 = from-nat 3
  
  -- Print bit representations
  print ("Bit representation of 5: " ++ showB bits5)
  print ("Bit representation of 3: " ++ showB bits3)
  
  -- Perform comparisons
  let eq-result = if (bits5 == bits3) then "True" else "False"
  let gt-result = if (bits5 > bits3) then "True" else "False"
  let lt-result = if (bits5 < bits3) then "True" else "False"
  
  -- Print comparison results
  print ("5 == 3: " ++ eq-result)
  print ("5 > 3: " ++ gt-result)
  print ("5 < 3: " ++ lt-result)
