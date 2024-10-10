
module Base.Queue.dequeue- where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Queue.Queue
open import Base.Queue.dequeue
open import Base.Equal.Equal
open import Agda.Primitive

-- Test: Dequeue from an empty queue
T0 : {a : Level} {A : Set a} → dequeue {a} {A} (MkQueue [] []) ≡ None
T0 = refl

-- Test: Dequeue from a queue with one element in front
T1 : dequeue (MkQueue (1 :: []) []) ≡ Some (1 , MkQueue [] [])
T1 = refl

-- Test: Dequeue from a queue with multiple elements in front
T2 : dequeue (MkQueue (1 :: 2 :: 3 :: []) []) ≡ Some (1 , MkQueue (2 :: 3 :: []) [])
T2 = refl

-- Test: Dequeue from a queue with elements only in back
T3 : dequeue (MkQueue [] (3 :: 2 :: 1 :: [])) ≡ Some (1 , MkQueue (2 :: 3 :: []) [])
T3 = refl

-- Test: Dequeue from a queue with elements in both front and back
T4 : dequeue (MkQueue (1 :: []) (3 :: 2 :: [])) ≡ Some (1 , MkQueue [] (3 :: 2 :: []))
T4 = refl
