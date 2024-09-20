module Base.Ordering.Type where

-- Represents the result of a comparison.
-- - LT: Less than
-- - EQ: Equal to
-- - GT: Greater than
data Ordering : Set where
  LT : Ordering
  EQ : Ordering
  GT : Ordering