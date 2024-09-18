module Data.Queue.enqueue where

open import Data.Queue.Type
open import Data.List.Type

enqueue : ∀ {a} → {A : Set a} → Queue A → A → Queue A
enqueue (MkQueue f b) a = MkQueue f (a :: b)
