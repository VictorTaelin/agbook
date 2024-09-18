module Base.Equal.ALL where

open import Base.Equal.Type public
open import Base.Equal.apply public
open import Base.Equal.left public
open import Base.Equal.right public
open import Base.Equal.subst public
open import Base.Equal.sym public
open import Base.Equal.trans public

-- Re-export the equality type and its constructor
open Base.Equal.Type public using (_===_; refl)
