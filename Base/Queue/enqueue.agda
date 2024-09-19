module Base.Queue.enqueue where

open import Base.Queue.Type
open import Base.List.Type

enqueue : ∀ {a} → {A : Set a} → Queue A → A → Queue A
enqueue (MkQueue f b) a = MkQueue f (a :: b)
