module Base.ByteString.write-u48 where

open import Base.ByteString.Type
open import Base.ByteString.pack
open import Base.ByteString.unpack
open import Base.ByteString.show
open import Base.Nat.Type
open import Base.Nat.to-bits
open import Base.Nat.add
open import Base.Bits.Type
open import Base.Bits.split-chunks
open import Base.Bits.to-nat
import Base.Bits.show as Bits
open import Base.Bits.pad-zeros
open import Base.Bits.concat
open import Base.Word8.Type
import Base.Word8.from-nat as Word8
import Base.Word8.to-nat as Word8
open import Base.List.Type
open import Base.List.map
open import Base.List.take
open import Base.List.drop
open import Base.List.append
open import Base.List.replicate
open import Base.Unit.Type
open import Base.IO.ALL
open import Base.String.Type
import Base.String.append as String
import Base.Nat.show as Nat
open import Base.String.join

--# TASK:
--For some reason, when using read-u48, a number with length 48 is read with length 49, which causes incorrect results.
-- Example of execution below:
-- Writing value: 1450
--At position: 0
--Original ByteString: ""
--Padded bits: 010101011010000000000000000000000000000000000000e
--Bit chunks: 01010101e,10100000e,00000000e,00000000e,00000000e,00000000e
--Byte values: 170,5,0,0,0,0
--Resulting ByteString: "\170\ENQ\NUL\NUL\NUL\NUL"
--Reading from ByteString: "\170\ENQ\NUL\NUL\NUL\NUL"
--At position: 0
--Extracted bytes: 170,5,0,0,0,0
--Concatenated bits: 0101010101010000000000000000000000000000000000000e
--Read value: 2730
-- Fix the problem 


-- Converts a list of Bits to a String representation.
-- Each Bits value is converted to its string representation and joined with commas.
-- - bits: The list of Bits to convert.
-- = A string representation of the list of Bits.
show-list-bits : List Bits → String
show-list-bits bits = join "," (map Bits.show bits)

-- Writes a 48-bit unsigned integer (Nat) into a ByteString at a specified position
write-u48 : ByteString → Nat → Nat → IO ByteString
write-u48 bs pos value = do
  print (String.append "Writing value: " (Nat.show value))
  print (String.append "At position: " (Nat.show pos))
  
  let original = unpack bs
  print (String.append "Original ByteString: " (show bs))
  
  let bits = pad-zeros 48 (to-bits value)
  print (String.append "Padded bits: " (Bits.show bits))
  
  let chunks = split-chunks 8 bits
  print (String.append "Bit chunks: " (show-list-bits chunks))
  
  let bytes = map (λ x → Word8.from-nat (to-nat x)) chunks
  print (String.append "Byte values: " (join "," (map (λ x → Nat.show (Word8.to-nat x)) bytes)))
  
  let before = take pos original
  let after = drop (pos + 6) original
  let result = pack (before ++ bytes ++ after)
  
  print (String.append "Resulting ByteString: " (show result))
  
  pure result

-- Reads a 48-bit unsigned integer (Nat) from a ByteString at a specified position
read-u48 : ByteString → Nat → IO Nat
read-u48 bs pos = do
  print (String.append "Reading from ByteString: " (show bs))
  print (String.append "At position: " (Nat.show pos))
  
  let bytes = take 6 (drop pos (unpack bs))
  print (String.append "Extracted bytes: " (join "," (map (λ x → Nat.show (Word8.to-nat x)) bytes)))

  let bit-list = (map (λ x → pad-zeros 8 (to-bits (Word8.to-nat x))) bytes)
  print ( show-list-bits bit-list )
  
  let bits = concat (map (λ x → pad-zeros 8 (to-bits (Word8.to-nat x))) bytes)
  let truncatedBits = pad-zeros 48 bits  -- Ensure we have exactly 48 bits
  print (String.append "Concatenated bits: " (Bits.show truncatedBits))
  
  let result = to-nat truncatedBits
  print (String.append "Read value: " (Nat.show result))
  
  pure result

-- Main function to test write-u48 and read-u48
main : IO Unit
main = do
  -- Test 1: Writing and reading at index 0
  let testValue1 = 1450
  let emptyBS = pack []
  writtenBS1 ← write-u48 emptyBS 0 testValue1
  readValue1 ← read-u48 writtenBS1 0
  print (String.append "Test 1 - Original value: " (Nat.show testValue1))
  print (String.append "Test 1 - Bits: " (Bits.show (to-bits testValue1)))
  print (String.append "Test 1 - Read value: " (Nat.show readValue1))

  -- Test 2: Writing and reading at a different index
  let testValue2 = 98
  let initialBS = pack (replicate 10 (Word8.from-nat 0))  -- Create a ByteString with 10 zero bytes
  writtenBS2 ← write-u48 initialBS 4 testValue2  -- Write at index 4
  readValue2 ← read-u48 writtenBS2 4  -- Read from index 4
  print (String.append "Test 2 - Original value: " (Nat.show testValue2))
  print (String.append "Test 2 - Read value: " (Nat.show readValue2))
