module List.Main where

-- A polymorphic List with two constructors:
-- - _,_ : appends an element to a list.
-- - []  : the empty list.
data List {a} (A : Set a) : Set a where
  []  : List A
  _,_ : (x : A) (xs : List A) → List A
{-# BUILTIN LIST List #-}

infixr 5 _,_
