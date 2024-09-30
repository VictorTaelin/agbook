module ARC.DSL.Functions.interval where

open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.List.List

import ARC.DSL.Types.Integer.Functions as I
import ARC.DSL.Types.List.Functions as L

open import Base.Ordering.Ordering

-- Generates a list of integers from start (inclusive) to stop (exclusive) with a given step.
-- - start: The first number in the interval.
-- - stop: The number after the last number in the interval.
-- - step: The increment between each number in the interval.
-- = A list of integers representing the interval.
{-# TERMINATING #-}
interval : Integer → Integer → Integer → List Integer
interval start stop step with I.compare start stop
... | LT = start :: interval (start I.+ step) stop step
... | EQ = []
... | GT = []
