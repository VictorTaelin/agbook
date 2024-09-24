module Bend.Net.link where

open import Base.Maybe.Type
open import Base.Maybe.Monad.bind
open import Bend.Net.Type
open import Bend.Net.Port.Type
open import Bend.Net.set-port

link : Net -> Port -> Port -> Maybe Net
link net a b = do
  net <- set-port net a b
  net <- set-port net b a
  Some net
