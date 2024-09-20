module Base.List.Type where

-- A polymorphic List with two constructors:
-- - _::_ : Appends an element to a list.
-- - []  : The empty list.
data List {a} (A : Set a) : Set a where
  []   : List A
  _::_ : (head : A) (tail : List A) → List A
{-# BUILTIN LIST List #-}

infixr 5 _::_