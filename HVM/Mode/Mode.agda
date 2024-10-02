module HVM.Mode.Mode where

-- WIRED Mode: aux-aux wires point directly to the target port
-- NAMED Mode: aux-aux wires are globally unique identifiers
data Mode : Set where
  WIRED : Mode
  NAMED : Mode
