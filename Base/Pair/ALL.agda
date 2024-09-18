module Base.Pair.ALL where

open import Base.Pair.Type public
open import Base.Pair.get-fst public
open import Base.Pair.get-snd public
open import Base.Pair.map public
open import Base.Pair.set-fst public
open import Base.Pair.set-snd public
open import Base.Pair.mut-fst public
open import Base.Pair.mut-snd public

-- Re-export the Sigma, Σ, and Pair types
open Base.Pair.Type public using (Sigma; Σ; Pair; _,_)
