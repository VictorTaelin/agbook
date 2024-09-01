module Main where

open import Data.IO.Type
open import Data.Unit.Type
open import Data.String.Type
open import Data.String.append
open import Data.Int.Type
open import Data.Float.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.U64.Type
open import Data.U64.add
open import Data.Bool.Type

intValue : Int
intValue = Pos 42

intStr : String
intStr = primShowInteger intValue

floatVal : Float
floatVal = primIntToFloat intValue

floatStr : String
floatStr = primShowFloat floatVal

natVal : Nat
natVal = Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))))))

natSum : Nat
natSum = natVal + Succ (Succ (Succ (Succ (Succ Zero))))

natStr : String
natStr = primShowInteger (Pos natSum)

word1 : U64
word1 = primWord64FromNat 100

word2 : U64
word2 = primWord64FromNat 200

wordSum : U64
wordSum = addU64 word1 word2

wordStr : String
wordStr = primShowInteger (Pos (primWord64ToNat wordSum))

-- Main function that demonstrates usage of various primitives
main : IO Unit
main = putStrLn wordStr
