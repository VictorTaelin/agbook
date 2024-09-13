module Bend.Fun.Op.Type where

-- Binary operators between native numbers in Bend.
data Op : Set where
  Add : Op  -- Addition
  Sub : Op  -- Subtraction
  Mul : Op  -- Multiplication
  Div : Op  -- Division
  Rem : Op  -- Remainder
  Eql : Op  -- Equality
  Neq : Op  -- Inequality
  Ltn : Op  -- Less than
  Gtn : Op  -- Greater than
  Lte : Op  -- Less than or equal
  Gte : Op  -- Greater than or equal
  And : Op  -- Bitwise AND
  Or  : Op  -- Bitwise OR
  Xor : Op  -- Bitwise XOR
  Shl : Op  -- Shift left
  Shr : Op  -- Shift right
  Pow : Op  -- Exponentiation
