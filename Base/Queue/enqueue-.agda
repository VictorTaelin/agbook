module Base.Queue.enqueue- where

open import Base.List.List
open import Base.Queue.Queue
open import Base.Queue.enqueue
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: Enqueue to an empty queue
T0 : enqueue (MkQueue [] []) 1 ≡ MkQueue [] (1 :: [])
T0 = refl

-- Test: Enqueue to a queue with elements in front
T1 : enqueue (MkQueue (1 :: 2 :: []) []) 3 ≡ MkQueue (1 :: 2 :: []) (3 :: [])
T1 = refl

-- Test: Enqueue to a queue with elements in back
T2 : enqueue (MkQueue [] (2 :: 1 :: [])) 3 ≡ MkQueue [] (3 :: 2 :: 1 :: [])
T2 = refl

-- Test: Enqueue to a queue with elements in both front and back
T3 : enqueue (MkQueue (1 :: []) (3 :: 2 :: [])) 4 ≡ MkQueue (1 :: []) (4 :: 3 :: 2 :: [])
T3 = refl