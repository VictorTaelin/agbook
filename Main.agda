module Main where

open import Data.IO.Main
open import Data.Unit.Main
open import Data.String.Main
open import Data.String.append
open import Data.Int.Main
open import Data.Float.Main
open import Data.Nat.Main
open import Data.Nat.add
open import Data.Word.Main
open import Data.Word.add
open import Data.Bool.Main

intValue : Int
intValue = pos 42

intStr : String
intStr = primShowInteger intValue

floatVal : Float
floatVal = primIntToFloat intValue

floatStr : String
floatStr = primShowFloat floatVal

natVal : Nat
natVal = 10

natSum : Nat
natSum = natVal + 5

natStr : String
natStr = primShowInteger (pos natSum)

word1 : Word64
word1 = primWord64FromNat 100

word2 : Word64
word2 = primWord64FromNat 200

wordSum : Word64
wordSum = addWord word1 word2

wordStr : String
wordStr = primShowInteger (pos (primWord64ToNat wordSum))

-- Main function that demonstrates usage of various primitives
main : IO Unit
main = putStrLn wordStr

--data N : Set where
  --s : N -> N
  --z : N

--add : N → N → N
--add z     m = m
--add (s n) m = add n (s m)

--mod3 : N → N
--mod3 z             = z
--mod3 (s z)         = s z
--mod3 (s (s z))     = s (s z)
--mod3 (s (s (s n))) = mod3 n

--fib3 : N → N
--fib3 z         = z
--fib3 (s z)     = s z
--fib3 (s (s n)) = mod3 (add (fib3 n) (fib3 (s n)))

--show : N → String
--show z     = "z"
--show (s n) = "(s " ++ show n ++ ")"

--main : IO Unit
--main = putStrLn ("result = " ++ show (fib3
  --(s (s (s (s
  --(s (s (s (s (s (s (s (s
  --(s (s (s (s (s (s (s (s
  --(s (s (s (s (s (s (s (s
  --(s (s (s (s (s (s (s (s z))))))))))))))))))))))))))))))))))))))
