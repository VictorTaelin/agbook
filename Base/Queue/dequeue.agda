module Base.Queue.dequeue where

open import Base.Queue.Type
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.List.reverse

dequeue : ∀ {a} → {A : Set a} → Queue A → Maybe (Pair A (Queue A))
dequeue (MkQueue [] [])      = None
dequeue (MkQueue (x :: f) b) = Some (x , MkQueue f b)
dequeue (MkQueue [] b) with reverse b
... | []       = None
... | (x :: f) = Some (x , MkQueue f [])
