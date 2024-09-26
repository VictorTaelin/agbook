module Base.Queue.enqueue where

open import Base.List.List
open import Base.Queue.Queue

-- Adds an element to the end of a queue.
-- - 1st: The queue to which the element will be added.
-- - 2nd: The element to be added to the queue.
-- = A new queue with the element added to the end.
enqueue : ∀ {a} -> {A : Set a} -> Queue A -> A -> Queue A
enqueue (MkQueue f b) a = MkQueue f (a :: b)
