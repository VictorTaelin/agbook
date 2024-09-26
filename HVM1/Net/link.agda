module HVM1.Net.link where

open import HVM1.Net.Net
open import HVM1.Port.Port
open import HVM1.Node.Node
open import HVM1.Node.port-set
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Maybe.run
open import Base.Pair.Pair
open import Base.Equal.Equal
import Base.BitMap.BitMap as M
import Base.BitMap.get as M
import Base.BitMap.set as M

-- Links two ports in a Net.
-- - net: The Net to modify.
-- - a: The first Port to link.
-- - b: The second Port to link.
-- = The modified Net with the two ports linked.
link : Net -> Port -> Port -> Net
link (MkNet net) a b = run (MkNet net) (do
  node-a <- M.get net (Port.addr a)
  node-b <- M.get net (Port.addr b)
  let node-a = port-set node-a (Port.slot a) b
  let node-b = port-set node-b (Port.slot b) a
  let net    = M.set net (Port.addr a) node-a
  let net    = M.set net (Port.addr b) node-b
  Some (MkNet net))
