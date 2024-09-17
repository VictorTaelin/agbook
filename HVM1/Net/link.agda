module HVM1.Net.link where

open import HVM1.Net.Type
open import HVM1.Port.Type
open import HVM1.Node.Type
open import HVM1.Node.set-port
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Maybe.run
open import Data.Pair.Type
open import Data.Equal.Type
import Data.Map.Type as M
import Data.Map.get as M
import Data.Map.set as M

-- Links two ports in a Net.
-- - net: The Net to modify.
-- - a: The first Port to link.
-- - b: The second Port to link.
-- = The modified Net with the two ports linked.
link : Net → Port → Port → Net
link (MkNet net) a b = run (MkNet net) (do
  node-a ← M.get net (Port.addr a)
  node-b ← M.get net (Port.addr b)
  let node-a = set-port node-a (Port.slot a) b
  let node-b = set-port node-b (Port.slot b) a
  let net    = M.set net (Port.addr a) node-a
  let net    = M.set net (Port.addr b) node-b
  Some (MkNet net))
