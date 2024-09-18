module Data.Queue.dequeue where

open import Data.Queue.Type
open import Data.List.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.List.reverse

dequeue : ∀ {a} → {A : Set a} → Queue A → Maybe (Pair A (Queue A))
dequeue (MkQueue [] [])      = None
dequeue (MkQueue (x :: f) b) = Some (x , MkQueue f b)
dequeue (MkQueue [] b) with reverse b
... | []       = None
... | (x :: f) = Some (x , MkQueue f [])
