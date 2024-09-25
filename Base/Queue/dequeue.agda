module Base.Queue.dequeue where

open import Base.List.Type
open import Base.List.reverse
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Queue.Type

-- Removes and returns the first element from a queue.
-- - 1st: The queue to dequeue from.
-- = A Maybe containing a Pair of the dequeued element and the remaining queue, or None if the queue is empty.
dequeue : ∀ {a} -> {A : Set a} -> Queue A -> Maybe (Pair A (Queue A))
dequeue (MkQueue [] [])      = None
dequeue (MkQueue (x :: f) b) = Some (x , MkQueue f b)
dequeue (MkQueue [] b) with reverse b
... | []       = None
... | (x :: f) = Some (x , MkQueue f [])
