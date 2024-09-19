module Base.Queue.Type where

open import Base.List.Type
open import Base.List.reverse
open import Base.Maybe.Type
open import Base.Pair.Type

-- A queue that stores a list of elements to be dequeued
-- and a list of elements that have been enqueued.
--
-- When dequeueing, if `deq` is empty then `enq` is reversed
-- and replaces `deq`.
record Queue {a} (A : Set a) : Set a where
  constructor MkQueue
  field
    front back : List A
