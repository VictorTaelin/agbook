module Base.Equal.Type where

infix 4 _===_

data _===_ {a} {A : Set a} (x : A) : A -> Set a where
  refl : x === x
{-# BUILTIN EQUALITY _===_  #-}
