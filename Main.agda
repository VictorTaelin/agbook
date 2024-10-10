module Main where

open import Base.ALL

-- [># NON_TERMINATING #<] -- FIXME!
-- loop : Nat → IO Unit
-- loop i = do
  -- IO.print ("Hello " <> show i)
  -- loop (i + 1)

-- main : IO Unit
-- main = loop 0

main : Bits
main = String.to-bits "fog of war"

